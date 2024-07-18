//
//  ContentView.swift
//  ContextMenu
//
//  Created by Mathieu Dubart on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor: Color = .red
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
        }
        .foregroundStyle(.white)
        .padding()
        .background(backgroundColor)
        
        VStack {
            Text("Change color")
                .padding()
                .contextMenu {
                    Button("Red") { self.backgroundColor = .red }
                    Button("Blue") { self.backgroundColor = .blue }
                    Button("Green") { self.backgroundColor = .green }
                }
        }
    }
}

#Preview {
    ContentView()
}
