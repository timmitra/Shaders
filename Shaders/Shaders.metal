//
//  Shaders.metal
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

#include <metal_stdlib>
using namespace metal;

/* passtrough takes a color and returns the same color */
[[ stitchable ]] half4 passthrough(float2 pos, half4 color) {
  return color;
}

/* all red, no green, no blue, same opacity */
[[ stitchable ]] half4 recolor(float2 pos, half4 color) {
  return half4(1, 0, 0, color.a);
}

/* all red, no green, no blue, invert opacity */
[[ stitchable ]] half4 invertAlpha(float2 pos, half4 color) {
  return half4(1, 0, 0, 1 - color.a);
}

/* gradiant fill */
[[ stitchable ]] half4 gradient(float2 pos, half4 color) {
  return half4(pos.x / pos.y, 0, pos.y / pos.x, color.a);
}
