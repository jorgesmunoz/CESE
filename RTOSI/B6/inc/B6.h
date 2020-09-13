/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/13
 * Version: 1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef __B6_H__
#define __B6_H__

/*=====[Inclusions of public function dependencies]==========================*/
#include <stdint.h>
#include <stddef.h>
#include <math.h>
#include "FreeRTOS.h"
#include "task.h"
#include "FreeRTOSConfig.h"
#include "sapi.h"

/*=====[C++ - begin]=========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/
#define TOTAL_LEDS  4
#define NUM_BUTTON  36
#define NUM_LED     41
#define MIN_PERIOD  500
/*=====[Public function-like macros]=========================================*/

/*=====[Definitions of public data types]====================================*/
TaskHandle_t task_handles[4];

typedef struct{
    gpioMap_t   led;
    portTickType xPeriodicity;
    portTickType xLastWakeTime;
}leds_t;

/*=====[Prototypes (declarations) of public functions]=======================*/

/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* __B6_H__ */
