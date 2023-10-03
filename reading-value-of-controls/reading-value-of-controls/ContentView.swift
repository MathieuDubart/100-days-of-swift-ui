//
//  ContentView.swift
//  reading-value-of-controls
//
//  Created by Mathieu Dubart on 02/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
            
            // ----- by default, voice over just says "increment" or "decrement" depending on the button we tapped.
        }
        .accessibilityElement()
        .accessibilityLabel("value")
        .accessibilityValue(String(value))
        // ----- will say "Value" followed by the value instead of increment/decrement
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case.decrement:
                value -= 1
            default:
                print("Not handled")
            }
            // ----- with this, when voice over's enabled, you can just swipe up or down to increment/decerement.
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
