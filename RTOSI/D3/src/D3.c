/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/04
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "D3.h"

#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/
char xMessage[CHAR_NUM];
const char* xTask[] = {"1", "2", "3", "4"};
static BaseType_t xErrorHandler;

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{
   boardInit();

   uint16_t i;

   for (i = 0; i < TASK_NUM; i++){

      strcpy(xMessage, TASK_MSG);
      strcat(xMessage, xTask[i]);

      // Create a task in freeRTOS with dynamic memory
      xErrorHandler = xTaskCreate(
         myTask,                     // Function that implements the task.
         (const char *)xMessage,     // Text name for the task.
         configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
         0,                          // Parameter passed into the task.
         tskIDLE_PRIORITY+1,         // Priority at which the task is created.
         0                           // Pointer to the task created in the system
      );

      if(xErrorHandler == pdPASS){
         printf("Task %d created\r\n", i+1);
      }
   }

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
