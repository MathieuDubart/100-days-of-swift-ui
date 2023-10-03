//
//  ContentView.swift
//  alerts-and-bg-color
//
//  Created by Mathieu Dubart on 04/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private  var showingAlert = false
    
    var body: some View {
        ZStack {
            Color.yellow
            Button("Show Alert") {
                showingAlert = true
            }
            .buttonStyle(.borderedProminent)
            .alert("Important message",isPresented: $showingAlert) {
                Button("Delete", role:.destructive) { print("Deleting") }
                Button("Cancel", role:.cancel) {}
            } message: {
                Text("You're going to delete all the data stored. Continue ?")
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

