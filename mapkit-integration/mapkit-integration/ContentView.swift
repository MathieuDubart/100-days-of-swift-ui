//
//  ContentView.swift
//  mapkit-integration
//
//  Created by Mathieu Dubart on 24/09/2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    struct Location: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
        
    }
    
    @State private var mapRegion = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var locations = [
        Location(name: "Buckingham Palace",
                 coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London",
                 coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
    ]
    
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 10, height: 10)
                    }
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
