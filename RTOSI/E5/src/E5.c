/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/05
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "E5.h"

#include "FreeRTOS.h"
#include "queue.h"
#include "FreeRTOSConfig.h"
#include "semphr.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/
DEBUG_PRINT_ENABLE;
/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/
QueueHandle_t xQueue_1_2;
QueueHandle_t xQueue_2_1;
char xMesaggeA[] = "Mensaje enviado por Tarea 1\r\n";
char xMesaggeB[] = "Mensaje enviado por Tarea 2\r\n";

MUTEX_DECLARE;

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{
   boardInit();

   debugPrintConfigUart( UART_USB, 115200 );

   xQueue_1_2 = xQueueCreate(1, sizeof(xMesaggeA));
   xQueue_2_1 = xQueueCreate(1, sizeof(xMesaggeB));;

   // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Task_1,                     // Function that implements the task.
      (const char *)"myTask",     // Text name for the task.
      configMINIMAL_STACK_SIZE*4, // Stack size in words, not bytes.
      0,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      0                           // Pointer to the task created in the system
   );

      // Create a task in freeRTOS with dynamic memory
   xTaskCreate(
      Task_2,                     // Function that implements the task.
      (const char *)"myTask",     // Text name for the task.
      configMINIMAL_STACK_SIZE*4, // Stack size in words, not bytes.
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
