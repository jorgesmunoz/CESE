/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/
#include "B3.h"
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
void myTask( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf( "Ejercicio B3.\r\n" );

   fsm_buttonInit();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      fsm_buttonUpdate(TEC1);
      
      TickType_t difference = get_cycle() / portTICK_RATE_MS;

      if(difference != 0){

         gpioWrite( LED, ON );

         // Send the task to the locked state during xPeriodicity
         // (periodical delay)
         vTaskDelay( difference );

         gpioWrite( LED, OFF );

         clear_cycle();
      }
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

