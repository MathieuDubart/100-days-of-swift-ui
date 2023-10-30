//
//  ContentView.swift
//  State property
//
//  Created by Mathieu Dubart on 10/08/2023.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

// ----- Les structures sont des types de valeur. Cela signifie que lorsque vous affectez une structure à une nouvelle variable ou la passez en tant qu'argument à une fonction, une copie indépendante de la structure est créée. Les modifications apportées à cette copie n'affecteront pas l'original.

// ----- Les classes sont des types de référence. Lorsque vous affectez une classe à une nouvelle variable ou la passez en tant qu'argument, vous travaillez avec une référence à la même instance de la classe. Les modifications apportées à cette instance seront visibles partout où cette référence est utilisée.

// ----- quand une variable change dans la structure, c'est toute la structure qui change (comme si on avait une instance à chaque changement)
// ----- En gros les classes on les utilises quand on veut que plusieurs Views aient les mêmes données (si ça change dans l'une des view alors ça change dans toutes)


// ----- si on utilise struct pour User et qu'on modifie le texte avec un Textfield, ça le met à jour dynamiquement.
// ----- ce n'est pas le cas si on utilise class

struct ContentView: View {
    @StateObject var user = User()
    // ----- @State permet de dire à Swift UI de surveiller les changements d'une propriété
    // ----- Quand on utilise Struct, à chaque fois qu'on lui change une propriété toute la structure change
    // ----- @State pouvait donc le voir et recharger correctement notre body
    // ----- si on créé une structure avec des propriétés variables mais qu'on l'instancie avec une constante, on ne peut pas changer les propriétés parce que Swift doit pouvoir détruire et recréer toute la structure à chaque changement de l'une de ses propriétés, chose impossible pour les structures constantes
    
    // ---- les classes n'ont pas besoin de mot clé mutating parce que même si la class est marquée comme constante, on peut en modifier les propriétés variables
    
    // ---- quand on utilise class au lieu de struct pour User, @State voit le changement PARCE QUE la strucutre se détruit et se recrée à chaque changement, donc swift peut le mettre à jour
    
    // ---- Pour la classe, comme elle ne se détruit/reconstruit pas à chaque modification, l'instance reste toujours la même et donc @State ne le voit pas et ne rechargera pas le body pour mettre à jour la view
    
    // ---- @State ne regarde pas les valeurs dans la classe MAIS l'instance de classe, ce qui explique qu'il ne voit pas le changement de propriété
    
    // ---- Au lieu d'utiliser @State, on utilisera @StateObject, @ObservedObject et @EnvironmentObject
    
    // ---- Pour surveiller le changement de CERTAINES propriétés d'une classe qui doivent recharger la vue au changement, on utlise @Published devant la variable de la classe et @StateObject (au lieu de @State) devant la déclaration de l'instance pour dire à Swift Ui qu'elle va changer (et donc recréer l'instance à chaque changement). On peut aussi retirer le private entre @StateObject et var
    
    // ---- Pour que ça fonctionne, notre classe doit IMPÉRATIVEMENT se conformer au protocol ObservableObject
    
    // ---- @StateObject est utilisé quand on créé la donnée pour la première fois. Partout où on la lit et/ou on la modifie sans en créer une nouvelle, on utilise @ObservedObject
    
    var body: some View {
        VStack {
            Text("\(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
