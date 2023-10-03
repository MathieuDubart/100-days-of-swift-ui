//
//  ContentView.swift
//  hierarchical-codable-data
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

// ----- la strucutre définie ici doit matcher avec celle de notre json

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Decode JSON") {
                let input = """
                {
                    "name": "Taylor Swift",
                    "address": {
                        "street": "555, Taylor Swift Avenue",
                        "city": "Nashville"
                    }
                }
                """
                
                let data = Data(input.utf8)
                
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    // ----- Et du coup ici swift remet les infos au bon endroit
                    print(user)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
