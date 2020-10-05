/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "E2.h"
#include "debounce.h"


/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/
debounce_t buttonStruct[TOTAL_TECLAS];
static BaseType_t xErrorHandler;

int main( void )
{
   boardInit();

   //Bucle para crear teclas
   for(int i = 0; i < TOTAL_TECLAS; i++){
      buttonStruct[i].button = NUM_BUTTON + i;
      buttonStruct[i].led = NUM_LED + i;
      buttonStruct[i].xQueue = xQueueCreate(QUEUE_LEN, TICKTYPE_LEN);
   }

   // Create a TEC1, TEC2, TEC3 y TEC4 task in freeRTOS with dynamic memory
   for(int i = 0; i < TOTAL_TECLAS; i++){
      xErrorHandler = xTaskCreate(
         button_task,                  // Function that implements the task.
         (const char *)"button_task",  // Text name for the task.
         configMINIMAL_STACK_SIZE*2,   // Stack size in words, not bytes.
         &buttonStruct[i],             // Parameter passed into the task.
         tskIDLE_PRIORITY+1,           // Priority at which the task is created.
         task_handles[i]               // Pointer to the task created in the system
      );

      if(xErrorHandler == pdPASS){
         printf("Tarea TEC%d  creada\r\n", i+1);
      }
   }

   // Create a LEDB, LED1, LED2 y LED3 task in freeRTOS with dynamic memory
   for(int i = 0; i < TOTAL_TECLAS; i++){
      xErrorHandler = xTaskCreate(
         led_task,                  // Function that implements the task.
         (const char *)"led_task",  // Text name for the task.
         configMINIMAL_STACK_SIZE*2,   // Stack size in words, not bytes.
         &buttonStruct[i],             // Parameter passed into the task.
         tskIDLE_PRIORITY+1,           // Priority at which the task is created.
         task_handles[i]               // Pointer to the task created in the system
      );

      if(xErrorHandler == pdPASS){
         printf("Tarea LED%d  creada\r\n", i+1);
      }
   }
   
   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
