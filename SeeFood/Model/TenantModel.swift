//
//  TenantModel.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import SwiftData
import Foundation

@Model
class MenuItem: Identifiable {
    var menuId: UUID = UUID()
    var image: String
    var name: String
    var des: String
    var price: String
//    var tenantID: UUID

    init(image: String, name: String, des: String, price: String) {
        self.image = image
        self.name = name
        self.des = des
        self.price = price
//        self.tenantID = tenantID
    }
}



@Model
class Tenant: Identifiable {
    var id: UUID
    var name: String
    var image: String
    
    // detail
    var menuItems: [MenuItem]
    var price: String
    var hour: String
    var phone: String
    
    var locationID: UUID
    
    init(name: String, image: String, menuItems: [MenuItem], price: String, hour: String, phone: String, locationID: UUID) {
        self.id = UUID()
        self.name = name
        self.image = image
        self.menuItems = menuItems
        self.price = price
        self.hour = hour
        self.phone = phone
        self.locationID = locationID
    }
}
