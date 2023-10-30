//
//  ContentView.swift
//  load-image-from-server
//
//  Created by Mathieu Dubart on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /*
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
            image
                .resizable()
                .scaledToFit()

        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        */
        
        AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image.")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
