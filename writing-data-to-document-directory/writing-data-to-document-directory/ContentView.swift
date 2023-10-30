//
//  ContentView.swift
//  writing-data-to-document-directory
//
//  Created by Mathieu Dubart on 17/09/2023.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    let str = "Test Message"
                    let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                    
                    do {
                        try str.write(to: url, atomically: true, encoding: .utf8)
                        let input = try String(contentsOf: url)
                        print(input)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .padding()
    }
    
    // ----- To find the document directory:
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    ContentView()
}
