/* Copyright 2018, Eric Pernia.
 * All rights reserved.
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
 *
 */

#include "F2.h"
#include "debounce.h"

extern SemaphoreHandle_t xSemaphore;

//Funcion para reiniciar ciclo
void clear_cycle(debounce_t* buttonStruct){
    taskENTER_CRITICAL();    
	buttonStruct->timePressed = 0;
    taskEXIT_CRITICAL();
}

//Funcion que lee los ticks al momento de pulsarse la tecla
void fsm_buttonPressed( debounce_t* buttonStruct ){
	taskENTER_CRITICAL();    
	buttonStruct->timeDown = xTaskGetTickCount();
    taskEXIT_CRITICAL();
}

//Funcion que lee los ticks al momento de liberarse la tecla
//Luego mide la diferencia de tiempo
void fsm_buttonReleased( debounce_t* buttonStruct ){
	taskENTER_CRITICAL();    
    buttonStruct->timeUp = xTaskGetTickCount();
	buttonStruct->timePressed = buttonStruct->timeUp - buttonStruct->timeDown;
    buttonStruct->State = ON;
    taskEXIT_CRITICAL();
    //xSemaphoreGive(buttonStruct->xSemaphore);
}

void fsm_buttonError( debounce_t* buttonStruct ){
    taskENTER_CRITICAL();    
    buttonStruct->buttonState = UP;
    taskEXIT_CRITICAL();
}

void fsm_buttonInit( debounce_t* buttonStruct ){
    taskENTER_CRITICAL();
    buttonStruct->buttonState = UP;
    taskEXIT_CRITICAL();
}

// FSM Update Sate Function
void fsm_buttonUpdate( debounce_t* buttonStruct )
{
    switch( buttonStruct->buttonState )
    {
        case UP:
            /* CHECK TRANSITION CONDITIONS */
            //Semaforo entregado por la ISR Fall de tecla
            if((xSemaphoreTake( buttonStruct->xSemaphoreISR, portMAX_DELAY )) == pdTRUE){
                buttonStruct->buttonState = FALLING;
            }
        
            break;

        case FALLING:
            /* CHECK TRANSITION CONDITIONS */
            if( !gpioRead( buttonStruct->button ) ){
                buttonStruct->buttonState = DOWN;
                /* ACCION DEL EVENTO !*/
                fsm_buttonPressed(buttonStruct);
            }
            else{
                buttonStruct->buttonState = UP;
            }

            break;

        case DOWN:
			/* CHECK TRANSITION CONDITIONS */
            //Semaforo entregado por la ISR Rise de tecla
            if((xSemaphoreTake( buttonStruct->xSemaphoreISR, portMAX_DELAY )) == pdTRUE){
                buttonStruct->buttonState = RISING;
            }
            break;

        case RISING:
            /* CHECK TRANSITION CONDITIONS */
            if( gpioRead( buttonStruct->button ) )                {
                buttonStruct->buttonState = UP;
                fsm_buttonReleased(buttonStruct);
            }
            else{
                buttonStruct->buttonState = DOWN;
            }
        break;

        default:
            fsm_buttonError(buttonStruct);
        break;
    }
}
