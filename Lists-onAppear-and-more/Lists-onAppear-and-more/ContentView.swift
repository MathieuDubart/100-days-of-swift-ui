//
//  ContentView.swift
//  Lists-onAppear-and-more
//
//  Created by Mathieu Dubart on 06/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isAwake = false
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        VStack {
            List {
                
                Section("People") {
                    ForEach(people, id:\.self){
                        Text($0)
                    }
                }
                
                Section("First section") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
                
                Section("Second section") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
                Toggle("\(isAwake ? "Awake" : "Asleep")", isOn: $isAwake)
            }
            .listStyle(.sidebar)
        }
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                //some code
            }
        }
    }
    
    func test() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let secondInput = """
        a
        b
        c
        """
        let secondLetters = secondInput.components(separatedBy: "\n")
        
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // ------------------
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: Locale.preferredLanguages.first ?? "en")

        let allGood = mispelledRange.location == NSNotFound
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
