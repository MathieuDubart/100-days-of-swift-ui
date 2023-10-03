//
//  ContentView.swift
//  face-id-and-touch-id
//
//  Created by Mathieu Dubart on 24/09/2023.
//

import LocalAuthentication
import SwiftUI

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
                    .padding(.vertical)
                Button("Authenticate",action: authenticate)
                    .buttonStyle(.borderedProminent)
            }
        }
        .padding()
    }
    
    func authenticate() {
        let context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    // ----- authenticated successfully
                    isUnlocked = true
                } else {
                    // ----- there was a problem
                }
            }
        } else {
            // ----- no biometrics
        }
    }
}

#Preview {
    ContentView()
}
