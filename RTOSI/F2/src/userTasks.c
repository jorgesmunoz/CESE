/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/
#include "debounce.h"
#include "userTasks.h"
 
/*=====[Inclusions of private function dependencies]=========================*/
#define BUTTON_PERIOD 1 / portTICK_RATE_MS
#define INITIAL_PERIOD 500 / portTICK_RATE_MS

/*=====[Definition macros of private constants]==============================*/


/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/
extern SemaphoreHandle_t xSemaphore;

/*=====[Definitions of private global variables]=============================*/
//SemaphoreHandle_t xSemaphore = NULL;

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void button_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      fsm_buttonUpdate( buttonStructure );
      vTaskDelay( DEBOUNCE_TIME );
   }
}

void led_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   TickType_t xPeriod = INITIAL_PERIOD;
   TickType_t xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      xQueueReceive( buttonStructure->xQueue, &xPeriod, 0 );
      
      xLastWakeTime = xTaskGetTickCount();
      gpioWrite(buttonStructure->led, ON);
      vTaskDelay(xPeriod);
      gpioWrite(buttonStructure->led, OFF);
      vTaskDelayUntil(&xLastWakeTime, xPeriod * 2);
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

