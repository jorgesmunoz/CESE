/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "userTasks.h"
#include "debounce.h"
#include "E4.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/
#define BUTTON_RATE 1

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void button_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      fsm_buttonUpdate( buttonStructure );

      vTaskDelay( BUTTON_RATE / portTICK_RATE_MS);

   }
}

void led_task_1Hz( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // Periodic task every 500 ms
   TickType_t xPeriod = LED_PERIOD;
   TickType_t xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      xLastWakeTime = xTaskGetTickCount();

      xSemaphoreTake(buttonStructure->xMutex, portMAX_DELAY);
      gpioWrite(buttonStructure->led, ON);
      vTaskDelay(xPeriod / 2);
      gpioWrite(buttonStructure->led, OFF);
      xSemaphoreGive(buttonStructure->xMutex);
      
      vTaskDelayUntil(&xLastWakeTime, xPeriod);
      
   }
}

void led_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   TickType_t xTime;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      xQueueReceive( buttonStructure->xQueue, &xTime, portMAX_DELAY );

      xSemaphoreTake(buttonStructure->xMutex, portMAX_DELAY);
      gpioWrite(buttonStructure->led, ON);
      vTaskDelay(xTime);
      gpioWrite(buttonStructure->led, OFF);
      xSemaphoreGive(buttonStructure->xMutex);
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

