//
//  Shaders.metal
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

#include <metal_stdlib>
using namespace metal;
#include <SwiftUI/SwiftUI_Metal.h>

/* color effects */
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

/* takes extra time argument and changes over time */
[[ stitchable ]] half4 rainbow( float2 pos, half4 color, float time) {
  float angle = atan2(pos.y, pos.x) + time;
  return half4(
               sin(angle),
               sin(angle + 2),
               sin(angle + 4),
               color.a);
}

/* distortion effects */
/* wave from 1 to -1*/
[[ stitchable ]] float2 wave(float2 pos,float time) {
  pos.y += sin(time * 5 + pos.y / 20) * 5;
  return pos;
}

/* relative wave with UV */
[[ stitchable ]] float2 relativeWave(float2 pos, float time, float2 size) {
  float2 distance = pos / size;
  pos.y += sin(time * 5 + pos.y / 20) * distance.x * 10;
  return pos;
}

/* layer effect */
[[ stitchable ]] half4 loupe(float2 pos, SwiftUI::Layer layer, float2 size, float2 touch) {
  float maxDistance = 0.05;
  float2 uv = pos / size;
  float2 center = touch / size;
  float2 delta = uv - center;
  float aspectRatio = size.x / size.y;
  /* how far from user's touch is the pixel */
  float distance = (delta.x * delta.x) + (delta.y * delta.y) / aspectRatio;
  float totalZoom = 1;
  if (distance < maxDistance) {
    totalZoom /= 2; // half the zoom
  }
  float2 newPos = delta * totalZoom + center;
  return layer.sample(newPos * size);
}

