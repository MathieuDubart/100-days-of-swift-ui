//
//  ContentView.swift
//  showing-hiding-views
//
//  Created by Mathieu Dubart on 10/08/2023.
//

import SwiftUI

// ----- Les sheets fonctionnent comme les alertes:
// ----- on déclare une seconde view
struct SecondView: View {
    // ----- Permet de dire à l'environnement de swift UI de désafficher la vue de la manière la plus appropriée quand on appelle dismiss()
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Second View")
            Button("Dismiss") {
                dismiss()
            }
        }
        .padding()
    }
}

struct ContentView: View {
    // ---- on déclare une variable qui permet de savoir si la sheet est montrée ou non (comme pour les alertes)
    @State private var showingSheet = false
    @State private var nameForSheet = "Anonymous"
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
        }
        .padding()
        // ---- on attache la sheet qq part dans notre vue (comme pour alert)
        .sheet(isPresented: $showingSheet) {
            SecondView(name: nameForSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
