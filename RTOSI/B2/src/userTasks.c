/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

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
   printf( "Ejercicio B2.\r\n" );

   gpioWrite( LED, ON );

   // Send the task to the locked state for 1 s (delay)
   vTaskDelay( 1000 / portTICK_RATE_MS );

   gpioWrite( LED, OFF ); 

   // Periodic task every 500 ms
   portTickType xCycle =  100 / portTICK_RATE_MS;
   portTickType xPeriodicity = 1000 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      while(xCycle < 1000 / portTICK_RATE_MS){         

         printf( "xCycle=%dms.\r\n", xCycle );

         gpioWrite( LED, ON );

         // Send the task to the locked state during xPeriodicity
         // (periodical delay)
         vTaskDelayUntil( &xLastWakeTime, xCycle );

         gpioWrite( LED, OFF );
         vTaskDelayUntil( &xLastWakeTime, (xPeriodicity - xCycle) );

         xCycle = xCycle + 100 / portTICK_RATE_MS;
      }

      xCycle =  100 / portTICK_RATE_MS;
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

