//
//  Location.swift
//  map-user-location
//
//  Created by Mathieu Dubart on 24/09/2023.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    
    // ----- CLLocationCoordinated2d() doesn't conform to Codable so we use doubles to be able to store them
    let latitude: Double
    let longitude: Double
}
