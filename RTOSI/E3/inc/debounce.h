// Includes de FreeRTOS
#include "E3.h"

#define DEBOUNCE_TIME 40

typedef enum
{
    UP,
    DOWN,
    FALLING,
    RISING
} fsmButtonState_t;

typedef struct {
    fsmButtonState_t buttonState;
    gpioMap_t button;
    gpioMap_t led;
    TickType_t timePressed;
    TickType_t timeUp;
    TickType_t timeDown;
    QueueHandle_t xQueue;
    uint8_t contFalling;
    uint8_t contRising;
}debounce_t;


void fsm_buttonError( debounce_t* buttonStruct );
void fsm_buttonInit( debounce_t* buttonStruct );
void fsm_buttonUpdate( debounce_t* buttonStruct );
void fsm_buttonPressed( debounce_t* buttonStruct );
void fsm_buttonReleased( debounce_t* buttonStruct );
void clear_cycle(debounce_t* buttonStruct);
