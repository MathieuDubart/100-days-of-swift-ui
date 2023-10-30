//
//  ContentView.swift
//  hiding-grouping-accessibility-data
//
//  Created by Mathieu Dubart on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // ----- decorative tells swiftUi this image can be ignored by the system
            // ----- But still accessible to voice over if it has important traits such as being a button
            // ----- But it won't read the name of the image (we must provide a label or an hint)
            Image(decorative: "character")
                // ----- This modifier tells swift ui that this image isn't visible anymore to voice over
                // ----- (use this only if the view does add nothing at all)
                .accessibilityHidden(true)

            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            // ----- this modifier(with .combine) tells swift ui to combine elements for voice over reading them together
            // ----- if we use .ignore, childrens of views become invisible for voice over
            .accessibilityElement(children: .combine)
            // ----- if we use .ignore and a label, it will read the label and not childrens content
            .accessibilityLabel("Your score is 1000")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
