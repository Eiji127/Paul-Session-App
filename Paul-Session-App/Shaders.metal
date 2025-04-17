//
//  Shaders.metal
//  Paul-Session-App
//
//  Created by eiji.shirakazu on 2025/04/17.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]]
float2 perspectiveTilt(float2 position,
                       float2 origin,
                       float2 size,
                       float strength) {
    float2 uv = (position - origin) / size;
    float z = strength;

    uv.x /= z;

    return uv * size + origin;
}
