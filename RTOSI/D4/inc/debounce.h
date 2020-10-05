// Includes de FreeRTOS
#include "D4.h"

#define DEBOUNCE_TIME 40
#define MAX_CYCLE     900 / portTICK_RATE_MS
#define MIN_CYCLE     100 / portTICK_RATE_MS

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
    TickType_t timePressed;
}debounce_t;

typedef struct {
    gpioMap_t led;
}led_t;

void fsm_buttonError( debounce_t* buttonStruct );
void fsm_buttonInit( debounce_t* buttonStruct );
void fsm_buttonUpdate( debounce_t* buttonStruct );
void fsm_buttonPressed( debounce_t* buttonStruct );
void fsm_buttonReleased( debounce_t* buttonStruct );
void clear_cycle(debounce_t* buttonStruct);
TickType_t get_cycle();
void dec_cycle();
