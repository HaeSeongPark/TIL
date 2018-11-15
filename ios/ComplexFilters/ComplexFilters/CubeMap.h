//
//  CubeMap.h
//  ComplexFilters
//
//  Created by rhino Q on 15/11/2018.
//  Copyright © 2018 rhino Q. All rights reserved.
//

#ifndef CubeMap_h
#define CubeMap_h

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct CubeMap {
    int length;
    float dimension;
    float *data;
};

struct CubeMap createCubeMap(float minHueAngle, float maxHueAngle);

#endif /* CubeMap_h */
