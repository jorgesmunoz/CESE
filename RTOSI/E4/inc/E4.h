/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/09/12
 * Version: 1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef __B4_H__
#define __B4_H__

/*=====[Inclusions of public function dependencies]==========================*/

#include <stdint.h>
#include <stddef.h>

#include "FreeRTOS.h"
#include "semphr.h"
#include "queue.h"
#include "FreeRTOSConfig.h"
#include "task.h"

#include "sapi.h"
#include "userTasks.h"

/*=====[C++ - begin]=========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/
#define TOTAL_TECLAS    4
#define NUM_LED         42
#define NUM_BUTTON      36
#define QUEUE_LEN       1
#define TICKTYPE_LEN    sizeof(TickType_t)

//Mensajes
#define ERROR_QUEUE     "Error al crear QUEUE_%d"
#define ERROR_MUTEX     "Error al crear MUTEX_%d"

//Mutex
#define MUTEX_DECLARE   SemaphoreHandle_t xMutex
#define MUTEX_CONFIG    xSemaphoreCreateMutex()
#define MUTEX_START     xSemaphoreTake(xMutex, portMAX_DELAY)
#define MUTEX_END       xSemaphoreGive(xMutex)

/*=====[Public function-like macros]=========================================*/

/*=====[Definitions of public data types]====================================*/
TaskHandle_t task_handles[4];

/*=====[Prototypes (declarations) of public functions]=======================*/

/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* __B4_H__ */
