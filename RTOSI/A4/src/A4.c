/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/09
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "A4.h"

#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/
int main( void )
{
   boardInit();

   // Create Tarea_A in freeRTOS with dynamic memory
   BaseType_t res_tarea_A = xTaskCreate(
      Tarea_A,                    // Function that implements the task.
      (const char *)"Tarea_A",    // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      NULL,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+4,         // Priority at which the task is created.
      &task_handles[0]            // Pointer to the task created in the system
   );

   if(res_tarea_A == pdFAIL){
      printf("Error al crear Tarea A\n");
   }

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
