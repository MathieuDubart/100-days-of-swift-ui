//
//  ContentView.swift
//  accessibility-useful-labels
//
//  Created by Mathieu Dubart on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            // ----- Quand voiceOver fonctionne: lit le nom entier de l'image (nom artiste + id)
           Image(pictures[selectedPicture])
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    selectedPicture = Int.random(in: 0...3)
                }
                .accessibilityLabel(labels[selectedPicture])
                // ----- Tells the device that our image is also a button
                .accessibilityAddTraits(.isButton)
                // ----- If we add this modifier, it tells the device that this is only a button and not an image anymore.
                .accessibilityRemoveTraits(.isImage)
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
