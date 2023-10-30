//
//  ContentView.swift
//  navigation-stack
//
//  Created by Mathieu Dubart on 14/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail for row \(row)")
                } label : {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("Navigation stacks")
        }
    }
}

#Preview {
    ContentView()
}
