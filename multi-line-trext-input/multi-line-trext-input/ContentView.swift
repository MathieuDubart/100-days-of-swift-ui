//
//  ContentView.swift
//  multi-line-trext-input
//
//  Created by Mathieu Dubart on 02/09/2023.
//

import SwiftUI

struct ContentView: View {
    // ----- NE JAMAIS STOCKER D'INFOS CONFIDENTIELLES/PRIVÉES DANS @APPSTORAGE
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
        }
    }
}

#Preview {
    ContentView()
}
