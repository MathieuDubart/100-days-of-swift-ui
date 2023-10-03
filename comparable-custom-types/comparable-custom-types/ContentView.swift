//
//  ContentView.swift
//  comparable-custom-types
//
//  Created by Mathieu Dubart on 17/09/2023.
//

import SwiftUI

struct
User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User (firstName: "Arnold", lastName: "Rimmer"),
        User (firstName: "Kristine", lastName: "Kochanski"),
        User (firstName: "David", lastName: "List")
    ].sorted()
    // ----- ici sorted utilise la méthode '<' native à struct User pour trier le tableau
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
