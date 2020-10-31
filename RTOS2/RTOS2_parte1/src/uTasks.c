/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/
#include "fsm_debounce.h"
#include "uTasks.h"

/*=====[Inclusions of private function dependencies]=========================*/
#define BUTTON_PERIOD 1 / portTICK_RATE_MS
#define INITIAL_PERIOD 500 / portTICK_RATE_MS

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/
QueueHandle_t cola_1;
static BaseType_t xErrorHandler;
debounce_t buttonStruct[TOTAL_TECLAS];

/*=====[Definitions of private global variables]=============================*/
char vMessage[MSG_LEN];

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/

// Task Init
void xTasksInit(void)
{

   //Queue create
   if ((cola_1 = xQueueCreate(QUEUE_LEN, sizeof(vMessage))) == pdFAIL)
   {
      //Queue error
      while (1)
         ;
   }

   //Tasks creation

   // Create Tarea_A
   xErrorHandler = xTaskCreate(
       Tarea_A,                      // Function that implements the task.
       (const char *)"Tarea_A",      // Text name for the task.
       configMINIMAL_STACK_SIZE * 2, // Stack size in words, not bytes.
       0,                            // Parameter passed into the task.
       tskIDLE_PRIORITY + 1,         // Priority at which the task is created.
       0                             // Pointer to the task created in the system
   );

   if (xErrorHandler == pdFAIL)
   {
      printf("Error Tarea_A\r\n");
      while (1)
         ;
   }

   //Create Tarea_B
   xErrorHandler = xTaskCreate(
       Tarea_B,                      // Function that implements the task.
       (const char *)"Tarea_B",      // Text name for the task.
       configMINIMAL_STACK_SIZE * 2, // Stack size in words, not bytes.
       0,                            // Parameter passed into the task.
       tskIDLE_PRIORITY + 1,         // Priority at which the task is created.
       0                             // Pointer to the task created in the system
   );

   if (xErrorHandler == pdFAIL)
   {
      printf("Error Tarea_B\r\n");
      while (1)
         ;
   }

   //Create Tarea_C
   xErrorHandler = xTaskCreate(
       Tarea_C,                      // Function that implements the task.
       (const char *)"Tarea_C",      // Text name for the task.
       configMINIMAL_STACK_SIZE * 2, // Stack size in words, not bytes.
       0,                            // Parameter passed into the task.
       tskIDLE_PRIORITY + 1,         // Priority at which the task is created.
       0                             // Pointer to the task created in the system
   );

   if (xErrorHandler == pdFAIL)
   {
      printf("Error Tarea_C\r\n");
      while (1)
         ;
   }
}

void Tarea_A(void *taskParmPtr)
{
   portTickType xPeriodicity = 1000 / portTICK_RATE_MS;
   portTickType xLastWakeTime = xTaskGetTickCount();

   const char vMsg[] = "LED_ON\r\n";

   while (1)
   {
      gpioToggle(LED1);

      if (LED1)
      {
         xQueueSend(cola_1, vMsg, portMAX_DELAY);
      }

      vTaskDelayUntil(&xLastWakeTime, xPeriodicity);
   }
}

void Tarea_B(void *taskParmPtr)
{
   char vMsg[MSG_LEN];

   //Create buttons
   for (int i = 0; i < TOTAL_TECLAS; i++)
   {
      buttonStruct[i].button = NUM_BUTTON + i;
   }

   while (1)
   {
      for (int i = 0; i < TOTAL_TECLAS; i++)
      {
         fsm_buttonUpdate(&buttonStruct[i]);
         if (buttonStruct[i].timePressed)
         {
            sprintf(vMsg, "TEC%d T%d\r\n", buttonStruct[i].button - NUM_BUTTON + 1, buttonStruct[i].timePressed);
            xQueueSend(cola_1, vMsg, portMAX_DELAY);
            clear_cycle(&buttonStruct[i]);
         }
      }

      vTaskDelay(1 / portTICK_RATE_MS);
   }
}

void Tarea_C(void *taskParmPtr)
{
   char vMsg[MSG_LEN];
   while (true)
   {
      xQueueReceive(cola_1, vMsg, portMAX_DELAY);
      printf("%s", vMsg);
   }
}
/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/
