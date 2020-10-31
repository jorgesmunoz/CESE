/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Inclusions of function dependencies]=================================*/

#include "RTOS2.h"
#include "fsm_debounce.h"
#include "uTasks.h"
//#include "isr.h"

/*=====[Definition macros of private constants]==============================*/
DEBUG_PRINT_ENABLE;
/*=====[Definitions of extern global variables]==============================*/

/*=====[Definitions of public global variables]==============================*/

/*=====[Definitions of private global variables]=============================*/

/*=====[Main function, program entry point after power on or reset]==========*/

int main(void)
{

   boardInit();

   xTasksInit();

   debugPrintConfigUart(UART_USB, 115200);

   // Configure button ISR
   //isr_config();

   vTaskStartScheduler(); // Initialize scheduler

   while (true)
      ; // If reach heare it means that the scheduler could not start

   // YOU NEVER REACH HERE, because this program runs directly or on a
   // microcontroller and is not called by any Operating System, as in the
   // case of a PC program.
   return 0;
}

// Hook dynamic object
void vApplicationMallocFailedHook()
{
   printf("Malloc Failed Hook!\n");
   configASSERT(0);
}