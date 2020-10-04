/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "C3.h"
#include "debounce.h"


/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/
xSemaphoreHandle xSemaphore;
debounce_t buttonStruct;
leds_t ledStruct[TOTAL_LEDS];
static BaseType_t xErrorHandler;

int main( void )
{
   boardInit();

   xSemaphore = xSemaphoreCreateCounting(MAX_SEM_COUNT, INI_SEM_COUNT);

   buttonStruct.button = TEC2;

   // Create a TEC1, TEC2, TEC3 y TEC4 task in freeRTOS with dynamic memory
   xErrorHandler = xTaskCreate(
      button_task,                  // Function that implements the task.
      (const char *)"button_task",  // Text name for the task.
      configMINIMAL_STACK_SIZE*2,   // Stack size in words, not bytes.
      &buttonStruct,             // Parameter passed into the task.
      tskIDLE_PRIORITY+1,           // Priority at which the task is created.
      task_handles[0]               // Pointer to the task created in the system
   );

   if(xErrorHandler == pdPASS){
      printf("Button task created.\r\n");
   }

   //Bucle para crear leds
   for(int i = 0; i < TOTAL_LEDS; i++){
      ledStruct[i].led = NUM_LED + i;
   }

   // Create a LEDB, LED1, LED2 y LED3 task in freeRTOS with dynamic memory
   for(int i = 0; i < TOTAL_LEDS; i++){
      xErrorHandler = xTaskCreate(
         led_task,                  // Function that implements the task.
         (const char *)"led_task",  // Text name for the task.
         configMINIMAL_STACK_SIZE*2,   // Stack size in words, not bytes.
         &ledStruct[i],             // Parameter passed into the task.
         tskIDLE_PRIORITY+1,           // Priority at which the task is created.
         task_handles[i+1]               // Pointer to the task created in the system
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
