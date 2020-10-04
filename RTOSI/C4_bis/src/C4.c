/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/03
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "C4.h"
#include "debounce.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/
SemaphoreHandle_t xSemaphore;
static BaseType_t xErrorHandler;
debounce_t buttonStruct;

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{
   boardInit();

   buttonStruct.button = TEC2;
   buttonStruct.led = LED1;

   xSemaphore = xSemaphoreCreateBinary();

   // Create a task in freeRTOS with dynamic memory
   xErrorHandler = xTaskCreate(
      button_task,                     // Function that implements the task.
      (const char *)"button_task",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      &buttonStruct,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      task_handler                           // Pointer to the task created in the system
   );

   if(xErrorHandler == pdPASS){
      printf("Button task created\r\n");
   }

   xErrorHandler = xTaskCreate(
      led_task,                     // Function that implements the task.
      (const char *)"led_task",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      &buttonStruct,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      task_handler                           // Pointer to the task created in the system
   );

   if(xErrorHandler == pdPASS){
      printf("Led task created\r\n");
   }

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
