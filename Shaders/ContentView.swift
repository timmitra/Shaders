//
//  ContentView.swift
//  Shaders
//
//  Created by Tim Mitra on 2023-11-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "figure.walk.circle")
            .font(.system(size: 300))
                .foregroundStyle(.blue)
                .colorEffect(ShaderLibrary.gradient())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
