//
//  ContentView.swift
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

import SwiftUI

struct ContentView: View {
  
  @State private var start = Date.now
  @State private var touch = CGPoint.zero
 
  
    var body: some View {
        VStack {
          TimelineView(.animation) { tl in 
            let elapsed = start.distance(to: tl.date)
            
            Image("jeff-shot")
              .visualEffect { content, proxy in
                content
                  .layerEffect(ShaderLibrary.loupe(.float2(proxy.size), .float2(touch)
                                                  ), maxSampleOffset: .zero)
              }
              .gesture(
              DragGesture(minimumDistance: 0)
                .onChanged{ touch = $0.location }
              )
            
//            VStack {
//              Image(systemName: "figure.walk.circle")
//                .font(.system(size: 300))
//                .foregroundStyle(.blue)
//                .distortionEffect(ShaderLibrary.wave(.float(elapsed)),
//                             maxSampleOffset: .zero
//              )
//              Image("Flag_of_Canada")
//                //.padding(.horizontal(20))
//                .visualEffect { content, proxy in
//                  content
//                    .distortionEffect(ShaderLibrary.relativeWave(.float( elapsed), .float2(proxy.size)
//),
//                                      maxSampleOffset: .zero
//                  )
//                }
//            }
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
