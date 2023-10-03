//
//  ContentView.swift
//  scroll-view
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        // ----- (.vertical) / (.horizontal) permet de choisir la direction du scroll
        ScrollView(.horizontal) {
            // ----- LazyVStack créé les élements lorsqu'il faut les afficher et prend systématiquement toute la place disponible contrairement à VStack
            LazyHStack {
                ForEach(0..<100) {
                    CustomText("Row \($0)")
                }
            }
            // .frame(maxWidth: .infinity)
            // ----- Pour que la largeur prenne tout l'écran (quand on utilise VStack
        }
    }
}

#Preview {
    ContentView()
}
