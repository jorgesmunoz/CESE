/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/

#include "B5.h"
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

// Task implementation
void button_task( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf( "Button task.\r\n" );

   debounce_t* buttonStructure = (debounce_t*) taskParmPtr;

   fsm_buttonInit(buttonStructure);

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

      fsm_buttonUpdate(buttonStructure);

      vTaskDelay(1 / portTICK_RATE_MS);
      
      TickType_t difference = buttonStructure->timePressed / portTICK_RATE_MS;

      if(difference != 0){

         xTaskCreate(
            led_task,                           // Function that implements the task.
            (const char *)"led_task",           // Text name for the task.
            configMINIMAL_STACK_SIZE*2,         // Stack size in words, not bytes.
            &buttonStructure->timePressed,      // Parameter passed into the task.
            tskIDLE_PRIORITY+2,                 // Priority at which the task is created.
            task_handles[1]                     // Pointer to the task created in the system
         );

         //printf("Se borra timePressed\r\n");
         buttonStructure->timePressed = 0; 
      }   
   }
}

//Implementation led_task
void led_task( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf( "Led task.\r\n" );

   TickType_t time_difference = *( (TickType_t*)  taskParmPtr );

   printf( "Enciende led.\r\n" );
   gpioWrite( LED, ON );

   vTaskDelay( time_difference );

   gpioWrite( LED, OFF );
   
   vTaskDelete(task_handles[1]);
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

