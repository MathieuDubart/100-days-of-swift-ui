//
//  ContentView.swift
//  swiftUI-Intro
//
//  Created by Mathieu Dubart on 02/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        VStack {
            NavigationView{
                Form {
                    Section {
                        Text("Hello \(name)!")
                        Text("Hello \(selectedStudent)!")
                        Text("Tap count: \(tapCount)")
                    }
                    
                    Section {
                        TextField("Enter your name", text: $name)
                        Button("Button") {
                            tapCount += 1
                        }
                    }
                    
                    Section {
                        Picker("Select your student", selection: $selectedStudent) { // Va afficher les différents nom + label "select your student"
                            ForEach(students, id: \.self) {//Pour chaque étudiant (id: \.self permet d'identifier chaque élève, \.self fait référence à la chaîne de caractère elle-même)
                                Text($0) // On affiche le nom
                            }
                        }
                    }
                }
                .navigationTitle("WeSplit")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
