//
//  LocationModel.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import SwiftData
import Foundation

struct Location : Identifiable {
    var id: UUID
    var name: String
    var latitude: Double
    var longitude: Double
    var image : String
    
    init(name: String, latitude: Double, longitude: Double, image: String) {
        self.id = UUID()
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
    }
}
    
