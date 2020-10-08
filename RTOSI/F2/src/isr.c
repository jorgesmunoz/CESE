/*=====[Module Name]===========================================================
 * Copyright YYYY Author Compelte Name <author@mail.com>
 * All rights reserved.
 * License: license text or at least name and link 
         (example: BSD-3-Clause <https://opensource.org/licenses/BSD-3-Clause>)
 *
 * Version: 0.0.0
 * Creation Date: YYYY/MM/DD
 */

/*=====[Inclusion of own header]=============================================*/

#include "isr.h"
#include "debounce.h"

/*=====[Inclusions of private function dependencies]=========================*/

/*=====[Definition macros of private constants]==============================*/

/*=====[Private function-like macros]========================================*/

/*=====[Definitions of private data types]===================================*/

/*=====[Definitions of external public global variables]=====================*/

/*=====[Definitions of public global variables]==============================*/
extern debounce_t buttonStruct[TOTAL_TECLAS];
/*=====[Definitions of private global variables]=============================*/

/*=====[Prototypes (declarations) of private functions]======================*/

/*=====[Implementations of public functions]=================================*/
void isr_config(void)
{
        //Inicializamos las interrupciones (LPCopen)
        Chip_PININT_Init(LPC_GPIO_PIN_INT);

        //Inicializamos de cada evento de interrupcion (LPCopen)

        /* Machete:
        GLOBAL! extern pinInitGpioLpc4337_t gpioPinsInit[];
        Chip_SCU_GPIOIntPinSel( j,  gpioPinsInit[i].gpio.port, gpioPinsInit[i].gpio.pin );   // TECi
        Chip_PININT_ClearIntStatus( LPC_GPIO_PIN_INT, PININTCH( j ) );                      // INTj (canal j -> hanlder GPIOj)       //Borra el pending de la IRQ
        Chip_PININT_SetPinModeEdge( LPC_GPIO_PIN_INT, PININTCH( j ) );                      // INTj //Selecciona activo por flanco
        Chip_PININT_EnableIntLow( LPC_GPIO_PIN_INT, PININTCH( j ) );                        // INTj //Selecciona activo por flanco descendente
        Chip_PININT_EnableIntHigh( LPC_GPIO_PIN_INT, PININTCH( j ) );                       // INTj //Selecciona activo por flanco ascendente
        */

        // TEC1 FALL
        Chip_SCU_GPIOIntPinSel(0, 0, 4); 
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH0);
        Chip_PININT_EnableIntLow(LPC_GPIO_PIN_INT, PININTCH0);

        // TEC1 RISE
        Chip_SCU_GPIOIntPinSel(1, 0, 4);                         
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH1);
        Chip_PININT_EnableIntHigh(LPC_GPIO_PIN_INT, PININTCH1);

        // TEC2 FALL
        Chip_SCU_GPIOIntPinSel(2, 0, 8);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH2);
        Chip_PININT_EnableIntLow(LPC_GPIO_PIN_INT, PININTCH2);

        // TEC2 RISE
        Chip_SCU_GPIOIntPinSel(3, 0, 8);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH3);
        Chip_PININT_EnableIntHigh(LPC_GPIO_PIN_INT, PININTCH3);

        // TEC3 FALL
        Chip_SCU_GPIOIntPinSel(4, 0, 9);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH4);
        Chip_PININT_EnableIntLow(LPC_GPIO_PIN_INT, PININTCH4);

        // TEC3 RISE
        Chip_SCU_GPIOIntPinSel(5, 0, 9);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH5);
        Chip_PININT_EnableIntHigh(LPC_GPIO_PIN_INT, PININTCH5);

        // TEC4 FALL
        Chip_SCU_GPIOIntPinSel(6, 1, 9);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH6);
        Chip_PININT_EnableIntLow(LPC_GPIO_PIN_INT, PININTCH6);

        // TEC4 RISE
        Chip_SCU_GPIOIntPinSel(7, 1, 9);
        Chip_PININT_SetPinModeEdge(LPC_GPIO_PIN_INT, PININTCH7);
        Chip_PININT_EnableIntHigh(LPC_GPIO_PIN_INT, PININTCH7);

        // ISR activation
        NVIC_SetPriority(PIN_INT0_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT0_IRQn);
        NVIC_SetPriority(PIN_INT1_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT1_IRQn);
        NVIC_SetPriority(PIN_INT2_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT2_IRQn);
        NVIC_SetPriority(PIN_INT3_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT3_IRQn);
        NVIC_SetPriority(PIN_INT4_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT4_IRQn);
        NVIC_SetPriority(PIN_INT5_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT5_IRQn);
        NVIC_SetPriority(PIN_INT6_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT6_IRQn);
        NVIC_SetPriority(PIN_INT7_IRQn, configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY);
        NVIC_EnableIRQ(PIN_INT7_IRQn);
}
/*=====[Implementations of interrupt functions]==============================*/
void GPIO0_IRQHandler(void) //asociado a tec1
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetFallStates(LPC_GPIO_PIN_INT) & PININTCH0)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH0);

                //keys_isr_fall(TEC1_INDEX);

                xSemaphoreGiveFromISR(buttonStruct[0].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }

        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO1_IRQHandler(void) //asociado a tec1
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetRiseStates(LPC_GPIO_PIN_INT) & PININTCH1)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH1);

                //keys_isr_rise(TEC1_INDEX);

                xSemaphoreGiveFromISR(buttonStruct[0].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }
        
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO2_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetFallStates(LPC_GPIO_PIN_INT) & PININTCH2)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH2);

                xSemaphoreGiveFromISR(buttonStruct[1].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }

        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO3_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetRiseStates(LPC_GPIO_PIN_INT) & PININTCH3)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH3);

                xSemaphoreGiveFromISR(buttonStruct[1].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO4_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetFallStates(LPC_GPIO_PIN_INT) & PININTCH4)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH4);

                xSemaphoreGiveFromISR(buttonStruct[2].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }

        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO5_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetRiseStates(LPC_GPIO_PIN_INT) & PININTCH5)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH5);

                xSemaphoreGiveFromISR(buttonStruct[2].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }
        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO6_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetFallStates(LPC_GPIO_PIN_INT) & PININTCH6)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH6);

                xSemaphoreGiveFromISR(buttonStruct[3].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }

        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

void GPIO7_IRQHandler(void)
{
        BaseType_t xHigherPriorityTaskWoken = pdFALSE;

        if (Chip_PININT_GetRiseStates(LPC_GPIO_PIN_INT) & PININTCH7)
        {
                Chip_PININT_ClearIntStatus(LPC_GPIO_PIN_INT, PININTCH7);

                xSemaphoreGiveFromISR(buttonStruct[3].xSemaphoreISR, &xHigherPriorityTaskWoken);
        }

        portYIELD_FROM_ISR(xHigherPriorityTaskWoken);
}

/*=====[Implementations of private functions]================================*/
