//
//  ContentView.swift
//  onDelete()
//
//  Created by Mathieu Dubart on 10/08/2023.
//

import SwiftUI

// ----- onDelete() est un modifier qui permet de supprimer un objet d'une collection
// ----- en pratique c'est exclusivement utilisé dans les listes et les ForEach()

struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    // ----- on utilise ForEach() dans List au lieu de
                    /* List(numbers, id:\.self) {
                     Text("Row \($0)")
                     } */
                    // ----- Parce que le onDelete() n'existe que sur les ForEach
                    
                    // ----- on appelle onDelete et on lui passe en param la méthode qui supprime les éléments
                    .onDelete(perform: removeRows)
                }
                
                Button("ADD NUMBER") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("onDelete()")
            
            // ----- on rajoute la toolbar avec un EditButton() qui, lorsqu'on clique dessus, va permettre de supprimer plusieurs rows facilement. Le comportement du EditBUtton() est définit automatiquement, du moins ici
            .toolbar {
                EditButton()
            }
        }
    }
    
    // ---- méthode qui permet de supprimer les éléments en fonction de leur place
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
