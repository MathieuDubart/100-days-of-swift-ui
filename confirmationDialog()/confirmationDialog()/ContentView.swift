//
//  ContentView.swift
//  confirmationDialog()
//
//  Created by Mathieu Dubart on 05/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingConfirmationDialog = false
    @State private var backgroundColor = Color.white
    var body: some View {
        VStack {
            Text("Hello world")
                .frame(width:300, height: 300)
                .background(backgroundColor)
                .onTapGesture {
                    showingConfirmationDialog = true
                }
        }
        .padding()
        .confirmationDialog("Change background", isPresented: $showingConfirmationDialog) {
            Button("Red") {
                backgroundColor = .red
            }
            Button("Green") {
                backgroundColor = .green
            }
            Button("Blue") {
                backgroundColor = .blue
            }
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Select the color you want")
        }
    }
}

#Preview {
    ContentView()
}
