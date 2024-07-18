//
//  ContentView.swift
//  SelectableListElements
//
//  Created by Mathieu Dubart on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    let users: [String] = ["Mike", "Elena", "David", "Taylor"]
    // Single selection
    // @State private var selection: String?
    
    // Multiple Selection
    @State private var selection = Set<String>()
    var body: some View {
        NavigationStack {
            VStack {
                List(users, id: \.self, selection: $selection) { user in
                    Text("\(user)")
                }
                
                // Single selection
                /* if let selection {
                    Text("You selected \(selection)")
                } */
                
                
                // Multiple selection
                if !selection.isEmpty {
                    Text("You selected \(selection.formatted())")
                }
            }
            .navigationTitle("List selection")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
