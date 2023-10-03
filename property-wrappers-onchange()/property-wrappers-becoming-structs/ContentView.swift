//
//  ContentView.swift
//  property-wrappers-becoming-structs
//
//  Created by Mathieu Dubart on 05/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 /*{
        didSet {
            print("newValue is \(blurAmount)")
            // ----- si on utilise le slider, ça ne print pas la nouvelle valeur.
            // ----- Par contre si on utilise le bouton, ça printe la nouvelle valeur.
            // ----- quand on utilise blurAmount, le property wrapper @State fait en sorte que derrière on est une structure State
            // ----- avec des propriété dedans (string, int, double...)
            // ----- pareil pour @Environment -> struct Environment
        }
    }
     */
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { newValue in
                    print("New value is \(newValue)")
                }
            
            Button("Random blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
