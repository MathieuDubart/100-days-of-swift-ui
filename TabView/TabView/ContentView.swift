//
//  ContentView.swift
//  TabView
//
//  Created by Mathieu Dubart on 30/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage:"globe")
                }
                .tag("Two")
        }
    }
}

#Preview {
    ContentView()
}
