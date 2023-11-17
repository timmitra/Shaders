//
//  ContentView.swift
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

import SwiftUI

struct ContentView: View {
  
  @State private var start = Date.now
  
    var body: some View {
        VStack {
          TimelineView(.animation) { tl in 
            let elapsed = start.distance(to: tl.date)
            
            Image(systemName: "figure.walk.circle")
              .font(.system(size: 300))
              .foregroundStyle(.blue)
              .distortionEffect(ShaderLibrary.wave(.float(elapsed)),
                           maxSampleOffset: .zero
              )
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
