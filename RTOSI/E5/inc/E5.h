/*=============================================================================
 * Copyright (c) 2020, jorge <jorgesmunoz@gmail.com>
 * All rights reserved.
 * License: bsd-3-clause (see LICENSE.txt)
 * Date: 2020/10/05
 * Version: 1.0
 *===========================================================================*/

/*=====[Avoid multiple inclusion - begin]====================================*/

#ifndef __E5_H__
#define __E5_H__

/*=====[Inclusions of public function dependencies]==========================*/

#include <stdint.h>
#include <stddef.h>


/*=====[C++ - begin]=========================================================*/

#ifdef __cplusplus
extern "C" {
#endif

/*=====[Definition macros of public constants]===============================*/
#define QUEUE_LEN   1


/*=====[Public function-like macros]=========================================*/
#define MUTEX_DECLARE   SemaphoreHandle_t xMutex
#define MUTEX_CONFIG    xMutex = xSemaphoreCreateMutex()
#define MUTEX_START     xSemaphoreTake(xMutex, portMAX_DELAY)
#define MUTEX_END       xSemaphoreGive(xMutex)
/*=====[Definitions of public data types]====================================*/

/*=====[Prototypes (declarations) of public functions]=======================*/

/*=====[Prototypes (declarations) of public interrupt functions]=============*/

/*=====[C++ - end]===========================================================*/

#ifdef __cplusplus
}
#endif

/*=====[Avoid multiple inclusion - end]======================================*/

#endif /* __E5_H__ */
