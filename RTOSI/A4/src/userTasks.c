/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/09
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusion of own header]=============================================*/
#include "userTasks.h"
#include "A4.h"
 
/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/
//Delay de 500 ms implementado con bucle for
void delay_con_for( uint32_t ms )
{
	volatile uint32_t i;
	volatile uint32_t j;

	for( i=0 ; i<ms ; i++ )
	{
      taskYIELD();
		/* delay de aprox 1 ms */
		for(j=0; j<CUENTAS_1MS; j++){
		}
	}
}

//Blinky cada 500 ms
void blink_n_500( uint32_t n, uint32_t led )
{
	/* genero 2 blinks*/
	int blink_count  = n;
	int cycles       = blink_count*2;

	for( ; cycles>0; cycles--){
		gpioToggle( led );
		delay_con_for( 500 );
	}
}

// Implementacion Tarea A
void Tarea_A( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf( "Inicia tarea A.\r\n" );

   // Create Tarea_A in freeRTOS with dynamic memory
   BaseType_t res_tarea_B = xTaskCreate(
      Tarea_B,                    // Function that implements the task.
      (const char *)"Tarea_B",    // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      NULL,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+2,         // Priority at which the task is created.
      &task_handles[1]            // Pointer to the task created in the system
   );

   if(res_tarea_B == pdFAIL){
      printf("Error al crear Tarea B\n");
   }

   // Create Tarea_C in freeRTOS with dynamic memory
   BaseType_t res_tarea_C = xTaskCreate(
      Tarea_C,                    // Function that implements the task.
      (const char *)"Tarea_C",    // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      NULL,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+2,         // Priority at which the task is created.
      &task_handles[2]            // Pointer to the task created in the system
   );

   if(res_tarea_C == pdFAIL){
      printf("Error al crear Tarea C\n");
   }

   // Create Tarea_C in freeRTOS with dynamic memory
   BaseType_t res_tarea_D = xTaskCreate(
      Tarea_D,                    // Function that implements the task.
      (const char *)"Tarea_D",    // Text name for the task.
      configMINIMAL_STACK_SIZE*2, // Stack size in words, not bytes.
      NULL,                          // Parameter passed into the task.
      tskIDLE_PRIORITY+1,         // Priority at which the task is created.
      &task_handles[3]            // Pointer to the task created in the system
   );

   if(res_tarea_D == pdFAIL){
      printf("Error al crear Tarea D\n");
   }

   //Suspende Tarea A
   printf("Suspende tarea A.\r\n");
   vTaskSuspend(task_handles[0]);   

   // ----- Task setup -----------------------------------
   //Reanuda tarea A
   printf("Reanuda tarea A.\r\n");

   blink_n_500(2, LEDB);

   vTaskSuspend(task_handles[0]);

   // ----- Task repeat for ever -------------------------
   while(TRUE) {

   }
}

// Implementacion Tarea B
void Tarea_B( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf("Inicia tarea B.\r\n");

   blink_n_500(3, LED1);

   //Reanuda Tarea A
   vTaskResume(task_handles[0]);

   //Suspende Tarea B
   printf("Suspende tarea B.\r\n");
   vTaskSuspend(task_handles[1]);
}

// Implementacion Tarea C
void Tarea_C( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf("Inicia tarea C.\r\n");

   blink_n_500(3, LED2);

   //Suspende Tarea C
   printf("Suspende tarea C.\r\n");
   vTaskSuspend(task_handles[2]);
}

// Implementacion Tarea D
void Tarea_D( void* taskParmPtr )
{
   // ----- Task setup -----------------------------------
   printf("Inicia tarea D.\r\n");

   //Destruye tareas A, B y C
   printf("Destruye tareas A, B y C.\r\n");
   vTaskDelete(task_handles[0]);
   vTaskDelete(task_handles[1]);
   vTaskDelete(task_handles[2]);

   while(1){
      blink_n_500(3, LED3);
   }

   //Si sale del while destruye tarea D
   vTaskDelete(task_handles[3]);
}

/*=====[Implementations of interrupt functions]==============================*/

/*=====[Implementations of private functions]================================*/

