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
   led_t* ledStructure = (led_t*) taskParmPtr;

   // ---------- CONFIGURACIONES ------------------------------
	// Configuracion de período de 1 seg (1000 ms)
   TickType_t xPeriodicity =  1000 / portTICK_RATE_MS;
	TickType_t xLastWakeTime = xTaskGetTickCount();
    
   //Bucle Task led
   while( TRUE )
   {
      TickType_t xCycle = get_cycle();

      if(xCycle == KEYS_INVALID_TIME ){
         //Espera 40 ms ya que es el debounce time definido
         vTaskDelay(DEBOUNCE_TIME / portTICK_RATE_MS);
      }
      else{
         
         gpioWrite(ledStructure->led , ON);
         //TaskDelay de valor cycle (Tiempo medido al pulsar tecla)
         vTaskDelay(xCycle);
         gpioWrite(ledStructure->led, OFF);

         vTaskDelayUntil( &xLastWakeTime , xPeriodicity );
      }
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

