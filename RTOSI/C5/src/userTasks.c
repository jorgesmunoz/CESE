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
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/
#define BUTTON_RATE 1

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/
//extern SemaphoreHandle_t xSemaphore;

/*=====[Definitions of private global variables]=============================*/
//SemaphoreHandle_t xSemaphore = NULL;

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void button_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   fsm_buttonInit(buttonStructure);

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      fsm_buttonUpdate( buttonStructure );

      vTaskDelay( BUTTON_RATE / portTICK_RATE_MS);

   }
}

void led_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // Periodic task every 500 ms
   TickType_t xPeriod = 1000 / portTICK_RATE_MS;
   TickType_t xLastWakeTime = xTaskGetTickCount();

   uint8_t contador = 0;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      contador = (uint8_t)uxSemaphoreGetCount(buttonStructure->xSemaphore);
		printf("Quedan %d semaforos\r\n",contador);
      
      if(xSemaphoreTake( buttonStructure->xSemaphore, portMAX_DELAY ) == pdTRUE){

         xLastWakeTime = xTaskGetTickCount();

         gpioWrite(buttonStructure->led, ON);
         vTaskDelay(xPeriod / 2);
         gpioWrite(buttonStructure->led, OFF);
         
         vTaskDelayUntil( &xLastWakeTime , xPeriod );      
      }
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

