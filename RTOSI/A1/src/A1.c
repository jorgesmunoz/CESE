/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/09
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "A1.h"

#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[Definition macros of private constants]==============================*/

/*==================[definiciones de datos externos]=========================*/

print_t debugPrint;

/*==================[declaraciones de funciones internas]====================*/

/*==================[declaraciones de funciones externas]====================*/
TaskHandle_t task_handles[3];

// Prototipo de funcion de la tarea
void Tarea1_Code( void*  );
void Tarea2_Code( void*  );
void Tarea_Monitor_Code( void*  );

/*==================[funcion principal]======================================*/

// FUNCION PRINCIPAL, PUNTO DE ENTRADA AL PROGRAMA LUEGO DE ENCENDIDO O RESET.
int main( void )
{
    // ---------- CONFIGURACIONES ------------------------------
    PRINTF_CONFIGURE;
    PRINTF( EXAMPLE_WELCOME_TEXT );

    // Crear tarea en freeRTOS
    BaseType_t res1 =
        xTaskCreate(
            Tarea1_Code,                // Funcion de la tarea a ejecutar
            ( const char * )"myTask 1", // Nombre de la tarea como String amigable para el usuario
            configMINIMAL_STACK_SIZE*2, /* tamaño del stack de cada tarea (words) */
            NULL,                       // Parametros de tarea
            tskIDLE_PRIORITY+1,         // Prioridad de la tarea
            &task_handles[0]            // Puntero a la tarea creada en el sistema
        );

    BaseType_t res2 =
        xTaskCreate(
            Tarea2_Code,                // Funcion de la tarea a ejecutar
            ( const char * )"myTask 2", // Nombre de la tarea como String amigable para el usuario
            configMINIMAL_STACK_SIZE*2, /* tamaño del stack de cada tarea (words) */
            NULL,                       // Parametros de tarea
            tskIDLE_PRIORITY+1,         // Prioridad de la tarea
            &task_handles[1]            // Puntero a la tarea creada en el sistema
        );

    BaseType_t res3=
        xTaskCreate(
            Tarea_Monitor_Code,         // Funcion de la tarea a ejecutar
            ( const char * )"monitor",  // Nombre de la tarea como String amigable para el usuario
            configMINIMAL_STACK_SIZE*4, /* tamaño del stack de cada tarea (words) */
            NULL,                       // Parametros de tarea
            tskIDLE_PRIORITY+1,         // Prioridad de la tarea
            &task_handles[2]            // Puntero a la tarea creada en el sistema
        );



    configASSERT( res1 == pdPASS && res2 == pdPASS );


    // Iniciar scheduler
    vTaskStartScheduler();

    // ---------- REPETIR POR SIEMPRE --------------------------
    while( 1 )
    {
        // Si cae en este while 1 significa que no pudo iniciar el scheduler
    }

    // NO DEBE LLEGAR NUNCA AQUI, debido a que a este programa se ejecuta
    // directamenteno sobre un microcontroladore y no es llamado por ningun
    // Sistema Operativo, como en el caso de un programa para PC.
    return 0;
}

/*==================[definiciones de funciones internas]=====================*/

/**
   @brief   Implementacion de un delay utilizando ciclos for.
            Se implementa solo para generar utilizacion de CPU sin bloquear a la tarea.

            NO DEBE UTILIZARSE BAJO NINGUN PUNTO DE VISTA EN UN APLICACION REAL SOBRE UN RTOS.

   @param cuentas
 */
void delay_con_for( uint32_t ms )
{
    volatile uint32_t i;
    volatile uint32_t j;

    for( i=0 ; i<ms ; i++ )
    {
        /* delay de aprox 1 ms */
        for( j=0 ; j<CUENTAS_1MS ; j++ )
        {
        }
    }
}

/*==================[definiciones de funciones externas]=====================*/

void Tarea1_Code( void* taskParmPtr )
{
    PRINTF( "Tarea 1\r\n" );

    while( 1 )
    {
        delay_con_for(2000);
        //PRINTF( "Blink %u at %u ms!\r\n", 1 , xTaskGetTickCount() );
        gpioToggle( LEDR );
    }
}

void Tarea2_Code( void* taskParmPtr )
{
    PRINTF( "Tarea 2\r\n" );

#if HACER_FALLAR==1
    uint32_t local_array[140];
#endif

    while( 1 )
    {
        delay_con_for( 500 );
        //PRINTF( "Blink %u at %u ms!\r\n", 2 , xTaskGetTickCount() );
        gpioToggle( LEDB );

#if HACER_FALLAR==1
        memset( local_array,0,20 );
#endif
    }
}

void Tarea_Monitor_Code( void* taskParmPtr )
{
    PRINTF( "Tarea 3\r\n" );

    while( 1 )
    {
        delay_con_for( 1000 );

        PRINTF( "Task %u min %u words\r\n", 1,  uxTaskGetStackHighWaterMark( task_handles[0] ) );
        PRINTF( "Task %u min %u words\r\n", 2,  uxTaskGetStackHighWaterMark( task_handles[1] ) );
        PRINTF( "Task %u min %u words\r\n", 3,  uxTaskGetStackHighWaterMark( task_handles[2] ) );
    }
}


/*==================[fin del archivo]========================================*/
