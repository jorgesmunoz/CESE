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

#include "C2.h"
#include "debounce.h"

TickType_t time_down;
TickType_t time_up;
TickType_t time_cycle;

extern SemaphoreHandle_t xSemaphore;

//Funcion para reiniciar ciclo
void clear_cycle(debounce_t* buttonStruct){
	buttonStruct->timePressed = 0;
}

//Funcion que lee los ticks al momento de pulsarse la tecla
void fsm_buttonPressed( debounce_t* buttonStruct ){
	time_down = xTaskGetTickCount();
}

//Funcion que lee los ticks al momento de liberarse la tecla
//Luego mide la diferencia de tiempo
void fsm_buttonReleased( debounce_t* buttonStruct ){
	time_up = xTaskGetTickCount();
	time_cycle = time_up - time_down;
    buttonStruct->timePressed = time_cycle;
    xSemaphoreGive(buttonStruct->xSemaphore);
}

void fsm_buttonError( debounce_t* buttonStruct ){
    buttonStruct->buttonState = BUTTON_UP;
}

void fsm_buttonInit( debounce_t* buttonStruct ){
    buttonStruct->buttonState = BUTTON_UP;
}

// FSM Update Sate Function
void fsm_buttonUpdate( debounce_t* buttonStruct )
{

    static uint8_t contFalling = 0;
    static uint8_t contRising = 0;

    switch( buttonStruct->buttonState )
    {
        case UP:
            /* CHECK TRANSITION CONDITIONS */
            if( !gpioRead( buttonStruct->button ) ){
                buttonStruct->buttonState = FALLING;
            }
            break;

        case FALLING:
            /* ENTRY */

            /* CHECK TRANSITION CONDITIONS */
            if( contFalling >= DEBOUNCE_TIME )
            {
                if( !gpioRead( buttonStruct->button ) )
                {
                    buttonStruct->buttonState = DOWN;

                    /* ACCION DEL EVENTO !*/
                    fsm_buttonPressed(buttonStruct);
                }
                else
                {
                    buttonStruct->buttonState = UP;
                }

                contFalling = 0;
            }

            contFalling++;

            /* LEAVE */
            break;

        case DOWN:
			/* CHECK TRANSITION CONDITIONS */
			if( gpioRead( buttonStruct->button ) )
			{
				buttonStruct->buttonState = RISING;
			}
			break;

        case RISING:
            /* ENTRY */

            /* CHECK TRANSITION CONDITIONS */

            if( contRising >= DEBOUNCE_TIME )
            {
                if( gpioRead( buttonStruct->button ) )
                {
                    buttonStruct->buttonState = UP;

                    /* ACCION DEL EVENTO ! */
                    fsm_buttonReleased(buttonStruct);
                }
                else
                {
                    buttonStruct->buttonState = DOWN;
                }
                contRising = 0;
            }
            contRising++;

            /* LEAVE */
            break;

        default:
            fsm_buttonError(buttonStruct);
            break;
    }
}
