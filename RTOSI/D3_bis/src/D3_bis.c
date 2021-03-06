/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/04
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "D3_bis.h"

#include "FreeRTOS.h"
#include "semphr.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/
DEBUG_PRINT_ENABLE;
MUTEX_DECLARE;
/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{
   boardInit();

   // UART for debug messages
   debugPrintConfigUart( UART_USB, 9600 );

   // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Tarea_1,                     // Function that implements the task.
      (const char *)"Tarea_1",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      0,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

      // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Tarea_2,                     // Function that implements the task.
      (const char *)"Tarea_2",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      0,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

      // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Tarea_3,                     // Function that implements the task.
      (const char *)"Tarea_3",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      0,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

      // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Tarea_4,                     // Function that implements the task.
      (const char *)"Tarea_4",     // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      0,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

   MUTEX_CONFIG;

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
