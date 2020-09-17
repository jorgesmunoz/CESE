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
#include "FreeRTOS.h"
#include "task.h"
#include "sapi.h"
#include "FreeRTOSConfig.h"
#include "debounce.h"

/*==================[definiciones y macros]==================================*/

/*==================[definiciones de datos internos]=========================*/
t_button button_config;


/*==================[definiciones de datos externos]=========================*/
DEBUG_PRINT_ENABLE;

/*==================[declaraciones de funciones internas]====================*/

/*==================[declaraciones de funciones externas]====================*/
TickType_t get_diff();
void clear_diff();
void fsmButtonInit( t_button* config );
void fsmButtonUpdate( t_button* config );

// Prototipo de funcion de la tarea
void led_task( void* taskParmPtr );
void button_task( void* taskParmPtr );

/*==================[funcion principal]======================================*/

// FUNCION PRINCIPAL, PUNTO DE ENTRADA AL PROGRAMA LUEGO DE ENCENDIDO O RESET.
int main( void )
{
    // ---------- CONFIGURACIONES ------------------------------
    // Inicializar y configurar la plataforma
    boardConfig();

    // UART for debug messages
    debugPrintConfigUart( UART_USB, 115200 );
    debugPrintlnString( "Ejericio C4\r\n" );

    // Led para dar se�al de vida
    //gpioWrite( LED3 , ON );

    button_config.led = LED1;
    button_config.button = TEC1;
    button_config.xSemaphore = xSemaphoreCreateBinary();

    // Crear tarea en freeRTOS

    xTaskCreate(
        led_task,                     // Funcion de la tarea a ejecutar
        ( const char * )"led_task",   // Nombre de la tarea como String amigable para el usuario
        configMINIMAL_STACK_SIZE*2, // Cantidad de stack de la tarea
        &button_config,                          // Parametros de tarea
        tskIDLE_PRIORITY+1,         // Prioridad de la tarea
        0                           // Puntero a la tarea creada en el sistema
    );

    xTaskCreate(
		button_task,                     	// Funcion de la tarea a ejecutar
		( const char * )"button_task",   // Nombre de la tarea como String amigable para el usuario
		configMINIMAL_STACK_SIZE*2, 	// Cantidad de stack de la tarea
		&button_config,        	// Parametros de tarea
		tskIDLE_PRIORITY+1,         	// Prioridad de la tarea
		0                           	// Puntero a la tarea creada en el sistema
	);


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

void button_task( void* taskParmPtr )
{
	t_button* button_struct = (t_button*) taskParmPtr;

	fsmButtonInit( button_struct );

	while( 1 )
	{
		fsmButtonUpdate( button_struct );
	 	vTaskDelay( 1 / portTICK_RATE_MS );
	}
}

// Implementacion de funcion de la tarea
void led_task( void* taskParmPtr )
{
    // ---------- CONFIGURACIONES ------------------------------
	t_button* button_struct = (t_button*) taskParmPtr;

	TickType_t xPeriodicity =  1000 / portTICK_RATE_MS;		// Tarea periodica cada 1000 ms
	TickType_t xLastWakeTime = xTaskGetTickCount();
    // ---------- REPETIR POR SIEMPRE --------------------------
    while( TRUE )
    {
    	TickType_t period = 500 / portTICK_RATE_MS;

    	if (xSemaphoreTake(button_struct->xSemaphore ,  xPeriodicity) == pdTRUE)
    		button_struct->led = LEDG;				
    	else
    		button_struct->led = LED1;				

		gpioWrite( button_struct->led , ON );
		vTaskDelay( period );
		gpioWrite( button_struct->led , OFF );

		vTaskDelayUntil( &xLastWakeTime , xPeriodicity );
    }
}

/*==================[fin del archivo]========================================*/
