//
//  ContentView.swift
//  UserDefaults
//
//  Created by Mathieu Dubart on 10/08/2023.
//

import SwiftUI

// ----- UserDefaults permet de stocker des petites quantités de données, parfait pour stocker les préférences utilisateur par exemple.S
// ----- les données sont chargées automatiquement quand l'app se lance, prêtes à être utilisées.
// ----- Plus on met de données, plus le lancement de l'app est longue.
// ----- Ile ne faut pas stocker plus de 0.5Mb dans le UserDefaults (512Kb).

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    // ----- faire attention avec les valeurs par défaut lorsque 1er lancement (ici 0), bool = false par défaut au 1er lancement si pas de valeur enregistrée.
    
    @AppStorage("secondTapCount") private var secondTapCount = 0
    // ----- Fonctionne aussi avec @AppStorage au lieu de @State sauf qu'on a pas besoin de recupérer la données à la main et de la set à la main + possibilité de setter une valeur par défaut si aucune valeur déjà sauvegardée.
    // ----- AppStorage, comme UserDefaults, n'est pas fait pour contenir bcp de donnée.
    
    var body: some View {
        VStack {
            Button("Tap count: \(tapCount)"){
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
                // ----- UserDefaults.standard = built-in instance de UserDefaults attachée et valable dans l'app.
                // ----- méthode set pour setter de la données (Int, String, Bool, etc....) puis on lui donne une clé (forKey) qui permet de lire la donnée écrite.
                // ----- UserDefaults n'écrit pas la donnée à chaque changement mais par paquets (ex: lorsqu'on arrête d'appuyer sur le bouton ça sauvegarde tous les changements).
                // ----- Cela demande qq secondes donc attention à ça.
            }
            
            
            Button("Second Tap count: \(secondTapCount)") {
                secondTapCount += 1
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
