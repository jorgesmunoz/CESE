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
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   TickType_t xTime = 0;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      if(xQueueReceive( buttonStructure->xQueue, &xTime, portMAX_DELAY ) == pdPASS){

         gpioWrite(buttonStructure->led, ON);
         vTaskDelay(xTime);
         gpioWrite(buttonStructure->led, OFF);
      }

   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

