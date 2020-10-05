/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/03
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "debounce.h"
#include "D4.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/
#define BUTTON_RATE 1

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

      vTaskDelay( BUTTON_RATE / portTICK_RATE_MS);

   }
}

void led_task_0( void* taskParmPtr )
{
   led_t* ledStructure = (led_t*) taskParmPtr;

   TickType_t xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      TickType_t xDifference = get_cycle() / portTICK_RATE_MS;

      xLastWakeTime = xTaskGetTickCount();

      gpioWrite(ledStructure->led, ON);
      vTaskDelay(xDifference / 2);
      gpioWrite(ledStructure->led, OFF);
      
      vTaskDelayUntil( &xLastWakeTime , xDifference );
   }

}

void led_task_1( void* taskParmPtr )
{
   led_t* ledStructure = (led_t*) taskParmPtr;

   // Periodic task every 500 ms
   TickType_t xPeriod = 2000 / portTICK_RATE_MS;
   TickType_t xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      TickType_t xDifference = get_cycle() / portTICK_RATE_MS;

      xLastWakeTime = xTaskGetTickCount();

      gpioWrite(ledStructure->led, ON);
      vTaskDelay(xDifference * 2);
      gpioWrite(ledStructure->led, OFF);
      
      vTaskDelayUntil( &xLastWakeTime , xPeriod );

      dec_cycle();
   }

}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

