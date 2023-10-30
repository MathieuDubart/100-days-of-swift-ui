//
//  ContentView.swift
//  custom-component-@binding
//
//  Created by Mathieu Dubart on 02/09/2023.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
//    @State var isOn: Bool
    // ----- @Binding permet de changer la valeur de la variable qui est assignée à isOn (ici rememberMe)
    // ----- En gros @Binding permet de fairte remonter l'information du changement à ContentView au lieu d'uniquement changer la valeur du booléen localement
    // ----- avec @State le changement de booléen ne s'efefctue que localement, càd que seul isOn est au courrant du changement.
    // ----- alors qu'avec @Binding, la veleur passée en paramètre de PushButton(isOn:) est également au courant du changement local, et donc peut mettre à jour la view au changement.
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
