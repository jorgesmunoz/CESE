/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "B5.h"
#include "debounce.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/
debounce_t buttonStruct;

int main( void )
{
   boardInit();

   buttonStruct.button = TEC1;

   // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      button_task,                // Function that implements the task.
      (const char *)"button_task",// Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      &buttonStruct,              // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      task_handles[0]             // Pointer to the task created in the system
   );

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
