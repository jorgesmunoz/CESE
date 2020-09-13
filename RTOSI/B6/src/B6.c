/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/13
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "B6.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/
leds_t ledStruct[TOTAL_LEDS];
static BaseType_t xErrorHandler;
static uint32_t xPeriod = MIN_PERIOD;

int main( void )
{
   printf( "Ejercicio B6.\r\n" );
   
   boardInit();

   //Bucle para crear leds
   for(int i = 1; i < (TOTAL_LEDS + 1); i++){      
      ledStruct[i-1].led = NUM_LED + i;
      ledStruct[i-1].xPeriodicity = xPeriod / portTICK_RATE_MS;
      ledStruct[i-1].xLastWakeTime = xTaskGetTickCount();
      xPeriod = xPeriod * 2;
   }

   // Create LEDB, LED1, LED2, LED3 task in freeRTOS with dynamic memory
   for(int i = 0; i < TOTAL_LEDS; i++){
      xErrorHandler = xTaskCreate(
         led_task,                   // Function that implements the task.
         (const char *)"led_task",   // Text name for the task.
         configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
         &ledStruct[i],              // Parameter passed into the task.
         tskIDLE_PRIORITY+1,         // Priority at which the task is created.
         task_handles[i]             // Pointer to the task created in the system
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
