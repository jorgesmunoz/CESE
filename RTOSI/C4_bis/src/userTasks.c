/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/03
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "debounce.h"
#include "C4.h"
 
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

void led_task( void* taskParmPtr )
{
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // Periodic task every 500 ms
   portTickType xPeriodicity =  1000 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   TickType_t xPeriod = 500 / portTICK_RATE_MS;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      //Opcion 1:
      buttonStructure->led = xSemaphoreTake( xSemaphore, 0 / portTICK_RATE_MS ) ? LEDG : LED1;
      
      //Opcion 2: Es una alternativa a la linea de arriba. El codigo hace lo mismo
      /*if(xSemaphoreTake( xSemaphore, 0 / portTICK_RATE_MS ) == pdTRUE){
         buttonStructure->led = LEDB;
      }
      else{
         buttonStructure->led = LED1;
      }*/
      
      gpioWrite(buttonStructure->led, ON);
      vTaskDelay(xPeriod / portTICK_RATE_MS);
      gpioWrite(buttonStructure->led, OFF);

      //Periodo de 1 segundo.
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

