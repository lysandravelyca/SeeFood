//
//  LocationModel.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import SwiftData
import Foundation

@Model
class Location : Identifiable {
    var id: UUID
    var name: String
    var latitude: Double
    var longitude: Double


    init(name: String ,latitude: Double, longitude: Double, tenants: [Tenant] = []) {
        self.id = UUID()
        self.name = name
        self.latitude = latitude
        self.longitude = longitude

    }
}
