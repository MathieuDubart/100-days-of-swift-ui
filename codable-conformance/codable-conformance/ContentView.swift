//
//  ContentView.swift
//  codable-conformance
//
//  Created by Mathieu Dubart on 16/08/2023.
//

import SwiftUI

class User: ObservableObject, Codable {
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    // ----- Published "transforme" la variable name en structure de type Published
    @Published var name = "Paul Hudson"
    
    // ----- ici Decoder = decocder général, on s'en fout de savoir d'où vient la donnée (JSON, Xml, Yml...), on veut juste savoir si on peut lire la donnée en provenant.
    // ----- required est là pour dire que n'importe qui qui veut hériter de la classe User doit override l'init avec sa propre donnée (en gros pour les clés)
    required init(from decoder: Decoder) throws {
        // ----- ici on demande au decoder un container (un ensemble de valeurs) et on lui dit qu'il aura toutes les clés contenues dans CodingKeys
        // ----- ex: ici il doit s'attendre à trouver un 'name'
        // ----- si les clés n'existent pas, ça lance une erreur et ça refuse de continuer.
        // ----- c'est important que ça lance une erreur car:
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // ----- lorsque qu'on essaye de decoder une chaîne de caractère spécifique, on dit (forKey: .name) au lieu de (forKey: "name")
        // ----- ce qui est bien mieux que UserDefaults car cela évite le risque de casse
        // ----- si on peut trouver la chaîne de carctère et que c'est une chaîne de caractère alors on la met dans name
        // ----- String.self est très important car il précise à swift qu'on veut un type String, et donc si on changeait @Publihsed var name pour y mettre 0, swift empêcherait de compiler pcq le type de name (Int) n'est plus compatible avec celui qu'on veut decoder (String.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
