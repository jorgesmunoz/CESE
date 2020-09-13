/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/13
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/
#include "B6.h"
#include "userTasks.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void led_task( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   leds_t* ledStruct = (leds_t*) taskParmPtr;
   
   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      gpioToggle( ledStruct->led );

      vTaskDelayUntil( &ledStruct->xLastWakeTime, ledStruct->xPeriodicity );
   }
}