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

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// button task implementation
void button_task( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   fsm_buttonInit(buttonStructure);  

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      fsm_buttonUpdate(buttonStructure);
      vTaskDelay(1 / portTICK_RATE_MS);
   }
}

// led_task implementation
void led_task( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      TickType_t tickPressed = buttonStructure->timePressed;

      if(tickPressed != 0){
         gpioWrite( buttonStructure->led, ON );

         vTaskDelay(tickPressed / portTICK_RATE_MS);

         gpioWrite( buttonStructure->led, OFF );

         buttonStructure->timePressed = 0;
      }
      else{
         vTaskDelay(DEBOUNCE_TIME / portTICK_RATE_MS);
      }
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

