//
//  ContentView.swift
//  Codable
//
//  Created by Mathieu Dubart on 11/08/2023.
//

import SwiftUI

// ----- Codable est un protocol qui permet d'archiver/désarchiver de la donnée.
// ----- ici on archive la Struct User quand elle est sauvegardée dans UserDefaults et on la désarchive quand une instance est lue.
// ----- Pour ça, il faut la structure soit conforme au protocol COdable.
// ----- Une fois que la strucutre estconforme au protocol, Swift se charge pour nous de générer le code requis pour archiver/désarchiver les instances de User.
// ----- Cependant, doit quand même dire à Swift quand archiver et ce qu'il doit faire de la donnée.
// ----- => Apparition d'un nouveau type: JsonEncoder
// ----- Son rôle est de prendre quelque chose conforme au protocol (ici la structure User) et de la renvoyer au format Json (le goat des formats) pour qu'on la stocker dans UserDefaults

struct User: Codable {
    let firstname: String
    let lastname: String
}


struct ContentView: View {
    
    @State private var user = User(firstname: "Taylor", lastname: "Swift")
    
    var body: some View {
        VStack {
            Button("Save User"){
                
                let encoder = JSONEncoder()
                // ----- Pour encoder de la donnée, la method .encode() peut lancer des erreurs donc TOUJOURS l'utiliser avec try
                if let data = try? encoder.encode(user) {
                    UserDefaults.standard.set(data, forKey: "UserData")
                } // ----- ici 'data' est de type 'Data', qui permet de stocker n'importe quel type de donnée (ex: Strings, Images, Zip files, etc....) et Data est un type supporté par UserDefaults.
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
