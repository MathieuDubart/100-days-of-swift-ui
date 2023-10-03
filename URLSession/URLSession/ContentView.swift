//
//  ContentView.swift
//  URLSession
//
//  Created by Mathieu Dubart on 16/08/2023.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}




struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) { track in
            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.collectionName)
                    .font(.subheadline)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song")
        else {
            print("Invalid url")
            return
        }
        
        do {
            // ----- le _ dans le tuple dit juste à swift de jeter la metadata, parce qu'on ne s'en sert pas
            let (data, _) = try await URLSession.shared.data(from: url)
            // ----- si la requête réussi sans erreur alors on converti la donnée reçue en donnée utilisable à l'aide de JSONDecoder()
            
            if let decodedReponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedReponse.results
            }
            
            // ----- sinon pour quelconque erreur on tombe dans le catch et on print qu'il y a erreur
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
