// Includes de FreeRTOS
#include "B3.h"

#define DEBOUNCE_TIME 40

typedef enum
{
    UP,
    DOWN,
    FALLING,
    RISING
} fsmButtonState_t;

void fsm_buttonError( void );
void fsm_buttonInit( void );
void fsm_buttonUpdate( gpioMap_t tecla );
void fsm_buttonPressed( void );
void fsm_buttonReleased( void );
TickType_t get_cycle();
void clear_cycle();
