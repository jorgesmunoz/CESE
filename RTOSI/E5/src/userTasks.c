/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/05
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "userTasks.h"
#include "E5.h"
#include "semphr.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/
extern QueueHandle_t xQueue_1_2;
extern QueueHandle_t xQueue_2_1;
extern char xMesaggeA[];
extern char xMesaggeB[];

extern MUTEX_DECLARE;

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void Task_1( void* taskParmPtr )
{
   char xMsgReceive[] = "";
   char xInicio[] = "Inicio!!\r\n";

   // Periodic task every 500 ms
   portTickType xPeriodicity =  1000 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   xQueueSend(xQueue_1_2, &xInicio, portMAX_DELAY);

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      xQueueReceive(xQueue_2_1, &xMsgReceive, portMAX_DELAY);

      MUTEX_START;
      printf(xMsgReceive);
      MUTEX_END;

      xQueueSend(xQueue_1_2, &xMesaggeA, portMAX_DELAY);      
      
      gpioWrite( LED1, ON );
      vTaskDelay(xPeriodicity / 2);
      gpioWrite( LED1, OFF );      
      
      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

// Task implementation
void Task_2( void* taskParmPtr )
{
   char xMsgReceive[] = "";
   
   // Periodic task every 500 ms
   portTickType xPeriodicity =  1000 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();
   
   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      xQueueReceive(xQueue_1_2, &xMsgReceive, portMAX_DELAY);

      MUTEX_START;
      printf(xMsgReceive);
      MUTEX_END;

      xQueueSend(xQueue_2_1, &xMesaggeB, portMAX_DELAY);
      
      gpioWrite( LED2, ON );

      gpioWrite( LED2, ON );
      vTaskDelay(xPeriodicity / 2);
      gpioWrite( LED2, OFF );      
      
      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

