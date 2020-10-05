/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/03
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "D4.h"
#include "debounce.h"

/*=====[Definition macros of private constants]==============================*/

/*=====[Definitions of extern global variables]==============================*/
MUTEX_DECLARE;

/*=====[Definitions of public global variables]==============================*/
SemaphoreHandle_t xSemaphore;
static BaseType_t xErrorHandler;
debounce_t buttonStruct[CANT_BUTTONS];
led_t ledStruct[CANT_LEDS];

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main( void )
{
   boardInit();

   uint8_t i;

   //Asigna buttons a la estructura debounce_t
   for(i = 0; i < CANT_BUTTONS; i++){
      //Arranca en TEC2 ya que la TEC1 no funciona bien en la EDU-CIAA
      buttonStruct[i].button = NUM_BUTTON + 1 + i;
   }

   // Create a task in freeRTOS with dynamic memory
   for(int i = 0; i < CANT_BUTTONS; i++){
      xErrorHandler = xTaskCreate(
         button_task,                     // Function that implements the task.
         (const char *)"button_task",     // Text name for the task.
         configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
         &buttonStruct[i],                          // Parameter passed into the task.
         tskIDLE_PRIORITY+1,         // Priority at which the task is created.
         task_handler[i]                           // Pointer to the task created in the system
      );

      if(xErrorHandler == pdPASS){
         printf("Button task%d created\r\n", i+1);
      }
   }

   //Asigna buttons a la estructura led_t
   for(i = 0; i < CANT_LEDS; i++){
      ledStruct[i].led = NUM_LED + i;
   }

   xErrorHandler = xTaskCreate(
         led_task_0,                     // Function that implements the task.
         (const char *)"led_task",     // Text name for the task.
         configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
         &ledStruct[DEF_LED_0],                          // Parameter passed into the task.
         tskIDLE_PRIORITY+1,         // Priority at which the task is created.
         task_handler[DEF_LED_0]                           // Pointer to the task created in the system
      );

   if(xErrorHandler == pdPASS){
      printf("Led task 0 created\r\n");
   }

   xErrorHandler = xTaskCreate(
         led_task_1,                     // Function that implements the task.
         (const char *)"led_task",     // Text name for the task.
         configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
         &ledStruct[DEF_LED_1],                          // Parameter passed into the task.
         tskIDLE_PRIORITY+1,         // Priority at which the task is created.
         task_handler[DEF_LED_1]                           // Pointer to the task created in the system
      );

   if(xErrorHandler == pdPASS){
      printf("Led task 1 created\r\n");
   }
   
   MUTEX_CONFIG;

   vTaskStartScheduler(); // Initialize scheduler

   while( true ); // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the 
   // case of a PC program.
   return 0;
}
