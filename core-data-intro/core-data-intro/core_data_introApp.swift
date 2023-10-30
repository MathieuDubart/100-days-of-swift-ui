//
//  core_data_introApp.swift
//  core-data-intro
//
//  Created by Mathieu Dubart on 02/09/2023.
//

import SwiftUI

@main
struct core_data_introApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                // ----- managedObjectContext est une "version live" de notre donnée.
                // ----- quand on charge la donnée et qu'on la modifie, elle n'existe que dans la mémoire
                // ----- tant qu'on ne dit pas explicitement de la sauvegarder dans le stockage persistant de l'iPhone (le SSD quoi).
                // ----- Plus rapide que de travailler directement sur le disque où l'on devrait constamment écrire/lire la donnée
                // ----- fonctionnement:
                // ----- On charge la donnée une fois
                // ----- On la modifie tant qu'on veut dans la mémoire
                // ----- On la sauvegarde quand on est prêt
        }
    }
}
