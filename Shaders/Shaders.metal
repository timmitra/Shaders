//
//  Shaders.metal
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 passthrough(float2 pos, half4 color) {
  return color;
}
