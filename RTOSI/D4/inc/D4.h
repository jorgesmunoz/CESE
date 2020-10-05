/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/03
 * Version: 1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef __C1_H__
#define __C1_H__

/*=====[Inclusions of public function dependencies]==========================*/

#include <stdint.h>
#include <stddef.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[C++ - begin]=========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/
#define CANT_LEDS       2
#define CANT_BUTTONS    2
#define NUM_LED         42
#define NUM_BUTTON      36
#define DEF_LED_0       0
#define DEF_LED_1       1

//Define para mutex
#define MUTEX_DECLARE   SemaphoreHandle_t xMutex
#define MUTEX_CONFIG    xMutex = xSemaphoreCreateMutex()
#define MUTEX_START     xSemaphoreTake(xMutex, portMAX_DELAY)
#define MUTEX_END       xSemaphoreGive(xMutex)
/*=====[Public function-like macros]=========================================*/

/*=====[Definitions of public data types]====================================*/
TaskHandle_t task_handler[3];

/*=====[Prototypes (declarations) of public functions]=======================*/

/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* __C1_H__ */
