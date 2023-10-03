 //
//  ContentView.swift
//  core-data-intro
//
//  Created by Mathieu Dubart on 02/09/2023.
//

import SwiftUI

// ----- Core Data permet de stocker une infinité de données contrairement à Codable ou AppStorage
// ----- mais on a aussi la possibilité de trier les données, les filtrer etc....

struct ContentView: View {
    // ----- moc n'a pas de type précisé parcequ'il a bcp de types différents.
    @Environment(\.managedObjectContext) var moc
    
    // ----- fait une nouvelle FetchRequest avec aucun tri, dans un ordre aléatoire.
    // ----- Ensuite passe la donnée dans la variable students de type FetchedResults de Student
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                // ----- même si la donnée est obligatoire dans Core Data, elle sera toujours un optional pour Swift
                Text(student.name ?? "Unknown")
            }
            
            Button("Add Student") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
