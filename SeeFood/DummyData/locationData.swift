//
//  locationData.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import Foundation

class LocationData {
    static let shared = LocationData()

    let locations: [Location] = [
        Location(name: "GOP 9", latitude: -6.302786900319068, longitude: 106.6520491053045),
        Location(name: "GOP 6", latitude: -6.303015263169143, longitude: 106.65284093993468),
        Location(name: "The Breeze", latitude: -6.301578784791051, longitude: 106.65513891375647),
        Location(name: "Traveloka Campus", latitude: -6.3016416811797455, longitude: 106.65057510507872)
    ]
}
