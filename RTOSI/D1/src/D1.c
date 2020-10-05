/* Copyright 2017-2018, Eric Pernia
 * All rights reserved.
 *
 * This file is part of sAPI Library.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/*==================[inlcusiones]============================================*/

// Includes de FreeRTOS
#include "D1.h"

/*==================[definiciones y macros]==================================*/

/*==================[definiciones de datos internos]=========================*/
TaskHandle_t task_handle[2];
/*==================[definiciones de datos externos]=========================*/
//DEBUG_PRINT_ENABLE;

/*==================[declaraciones de funciones internas]====================*/

/*==================[declaraciones de funciones externas]====================*/

/*==================[funcion principal]======================================*/

// FUNCION PRINCIPAL, PUNTO DE ENTRADA AL PROGRAMA LUEGO DE ENCENDIDO O RESET.
int main( void )
{
    
    // ---------- CONFIGURACIONES ------------------------------
    // Inicializar y configurar la plataforma
    boardConfig();
    printf("Ejercicio B7.\n" );
    
    // Led de inicio
    gpioWrite( LED3, ON );

    // Crear tarea en freeRTOS
    BaseType_t res_task_led =
    xTaskCreate(
        task_led,                   // Funcion de la tarea a ejecutar
        ( const char * )"task_led", // Nombre de la tarea como String amigable para el usuario
        configMINIMAL_STACK_SIZE*2, // Cantidad de stack de la tarea
        NULL,                       // Parametros de tarea
        tskIDLE_PRIORITY+1,         // Prioridad de la tarea
        &task_handle[0]             // Puntero a la tarea creada en el sistema
    );

    if(res_task_led == pdFAIL){
    	printf("Error al crear task_led.\n");
    }

    BaseType_t res_task_button =
    xTaskCreate(
    	task_button,                    // Funcion de la tarea a ejecutar
        ( const char * )"task_button",  // Nombre de la tarea como String amigable para el usuario
        configMINIMAL_STACK_SIZE*2, 	// Cantidad de stack de la tarea
        NULL,                          	// Parametros de tarea
        tskIDLE_PRIORITY+1,         	// Prioridad de la tarea
        &task_handle[1]                 // Puntero a la tarea creada en el sistema
    );

    if(res_task_button == pdFAIL){
    	printf("Error al crear task_button.\n");
    }

    	// Iniciar scheduler
    vTaskStartScheduler();

    // ---------- REPETIR POR SIEMPRE --------------------------
    while( TRUE )
    {
        // Si cae en este while 1 significa que no pudo iniciar el scheduler
    }

    // NO DEBE LLEGAR NUNCA AQUI, debido a que a este programa se ejecuta
    // directamenteno sobre un microcontroladore y no es llamado por ningun
    // Sistema Operativo, como en el caso de un programa para PC.
    return 0;
}

/*==================[definiciones de funciones internas]=====================*/

/*==================[definiciones de funciones externas]=====================*/

void task_button( void* taskParmPtr )
{
	printf("Task tecla.\n" );

    //Inicaliza tecla (TEC1)
    fsm_buttonInit();

	while( 1 )
	{
        //Funcion que actualiza estado de tecla cada 1 ms
		fsm_buttonUpdate( TEC2 );
	 	vTaskDelay( 1 / portTICK_RATE_MS );
	}
}

// Implementacion de funcion de la tarea
void task_led( void* taskParmPtr )
{
    printf("Task led.\n" );

    // ---------- CONFIGURACIONES ------------------------------
	// Configuracion de período de 1 seg (1000 ms)
    TickType_t xPeriodicity =  1000 / portTICK_RATE_MS;
	TickType_t xLastWakeTime = xTaskGetTickCount();
    
    //Bucle Task led
    while( TRUE )
    {
    	TickType_t xCycle = get_cycle();

    	if(xCycle == KEYS_INVALID_TIME ){
            //Espera 40 ms ya que es el debounce time definido
    		vTaskDelay(DEBOUNCE_TIME / portTICK_RATE_MS);
		}
		else{
			
            gpioWrite(LEDB , ON);
            //TaskDelay de valor cycle (Tiempo medido al pulsar tecla)
			vTaskDelay(xCycle);
			gpioWrite(LEDB, OFF);

			vTaskDelayUntil( &xLastWakeTime , xPeriodicity );
		}
    }
}

/*==================[fin del archivo]========================================*/
