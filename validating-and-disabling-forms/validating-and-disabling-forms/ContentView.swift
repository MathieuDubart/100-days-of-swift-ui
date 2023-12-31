//
//  ContentView.swift
//  validating-and-disabling-forms
//
//  Created by Mathieu Dubart on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section{
                Button("Create account") {
                    print("Creating account..")
                }
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    ContentView()
}
