//
//  ContentView.swift
//  CustomSwipeActions
//
//  Created by Mathieu Dubart on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    let names: [String] = ["Mike","Jessica","Evan","Audrey"]
    
    var body: some View {
        VStack {
            List(names, id: \.self) { name in
                Text(name)
                    .swipeActions {
                        Button("Delete", systemImage: "minus.circle", role: .destructive) {
                            print("Deleting")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Pin", systemImage: "pin") {
                            print("Pinning")
                        }
                        .tint(.orange)
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
