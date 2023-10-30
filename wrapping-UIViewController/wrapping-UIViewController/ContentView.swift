//
//  ContentView.swift
//  wrapping-UIViewController
//
//  Created by Mathieu Dubart on 06/09/2023.
//


/*
    Trois concepts importants dans UIKit:
    - UI Kit a une class appellée UIView qui est une classe parente pour toutes les vues et leurs layouts: boutons, labels, sliders, textfields....
    sont toutes des subclasses de UIView.
    
    - UI Kit a une class UIViewController qui est designé pour donner contenir tout le code nécessaire pour donner vie à une UIView. (a aussi bcp de subclasses qui font des trucs différents.)
 
    - UI Kit compte bcp sur le design  pattern de la délégation pour décider où se fait l'action.
 */
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("select image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

#Preview {
    ContentView()
}
