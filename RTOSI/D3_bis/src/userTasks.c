/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/04
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "userTasks.h"
#include "D3_bis.h"
#include "semphr.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/
extern MUTEX_DECLARE;
/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task implementation
void Tarea_1( void* taskParmPtr )
{
   // Periodic task every 500 ms
   portTickType xPeriodicity =  33 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      MUTEX_START;
      printf( "Hola soy Tarea 1\r\n" );
      MUTEX_END;

      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

// Task implementation
void Tarea_2( void* taskParmPtr )
{
   // Periodic task every 500 ms
   portTickType xPeriodicity =  55 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      MUTEX_START;
      printf( "Hola soy Tarea 2\r\n" );
      MUTEX_END;

      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

// Task implementation
void Tarea_3( void* taskParmPtr )
{
   // Periodic task every 500 ms
   portTickType xPeriodicity =  77 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      MUTEX_START;
      printf( "Hola soy Tarea 3\r\n" );
      MUTEX_END;

      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

// Task implementation
void Tarea_4( void* taskParmPtr )
{
   // Periodic task every 500 ms
   portTickType xPeriodicity =  99 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   // ----- Task repeat for ever -------------------------
   while(TRUE) {
      
      MUTEX_START;
      printf( "Hola soy Tarea 4\r\n" );
      MUTEX_END;

      // Send the task to the locked state during xPeriodicity
      // (periodical delay)
      vTaskDelayUntil( &xLastWakeTime, xPeriodicity );
   }
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

