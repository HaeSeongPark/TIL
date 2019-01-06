//
//  compute.metal
//  Let'Swift17Metal
//
//  Created by rhino Q on 06/01/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
// Metal Shader language
// https://developer.apple.com/metal/Metal-Shading-Language-Specification.pdf

#include <metal_stdlib>
using namespace metal;

// c++과 유사, c++과 다른 여러 타입 있음
//             commandEncoder.setTexture(drawable.texture, index: 0)
//            commandEncoder.setTexture(self.textture, index: 1)
kernel void compute(texture2d<float, access::write> output [[texture(0)]],
                    texture2d<float, access::sample> input [[texture(1)]],
                    uint2 gid [[thread_position_in_grid]]) {
    int width = output.get_width();
    int height = output.get_height();
    
    // gid 쉐이더를 실행시키는 쉐이더의 픽셀 위치?
    
    float2 p = float2(gid) / float2(width, height);
    
    constexpr sampler textureSampler(coord::normalized);
    
    output.write(input.sample(textureSampler, p) * 2 , gid);
}
