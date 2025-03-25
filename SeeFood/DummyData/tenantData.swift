//
//  tenantData.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import Foundation

class TenantData {
    static let shared = TenantData()
    let tenants: [Tenant]
    
//    var tenants2: [String: [Tenant]] = [
//        "GOP 9": [Tenant(name: <#T##String#>, image: <#T##String#>, menuItems: <#T##[MenuItem]#>, price: <#T##Int#>, hour: <#T##String#>, phone: <#T##String#>, locationID: <#T##UUID#>),
//                  Tenant(name: <#T##String#>, image: <#T##String#>, menuItems: <#T##[MenuItem]#>, price: <#T##Int#>, hour: <#T##String#>, phone: <#T##String#>, locationID: <#T##UUID#>)],
//        "GOP 6": [Tenant(name: <#T##String#>, image: <#T##String#>, menuItems: <#T##[MenuItem]#>, price: <#T##Int#>, hour: <#T##String#>, phone: <#T##String#>, locationID: <#T##UUID#>)]
//    ]
    
//    var t: [String: [String: Tenant]]

    init() {
        let locations = LocationData.shared.locations
        
//        tenants2["GOP 9"]["Kasturi"].menu

        tenants = [ 
                    // GOP 9
                    Tenant(name: "Tenant A", image: "logo", menuItems: [], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[0].id),
                    
                    Tenant(name: "Tenant B", image: "logo", menuItems: [], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[0].id),
                    
                    // GOP 6
                    Tenant(name: "Tenant C", image: "foto tenant", menuItems: [], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[1].id),
                    
                    Tenant(name: "Tenant D", image: "foto tenant", menuItems: [], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[1].id),
                    
                    // The Breeze
                    Tenant(name: "Tenant E", image: "foto tenant", menuItems: [], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[2].id),
                    
                    // Traveloka Campus
                    Tenant(name: "Tenant F", image: "foto tenant", menuItems: [
                    ], price: 10, hour: "10.00", phone: "nomor hp", locationID: locations[3].id)
                ]
        
        // GOP 9
        // Tenant A
        tenants[0].menuItems.append(MenuItem(image: "logo", name: "Ayam Saos Padang", des: "Logo utama", price: "10.00", tenantID: tenants[0].id))
        tenants[0].menuItems.append(MenuItem(image: "pohon", name: "Ayam Madu", des: "Gambar pohon", price: "10.00", tenantID: tenants[0].id))
        tenants[0].menuItems.append(MenuItem(image: "logo", name: "Menu 3", des: "Logo utama", price: "10.00", tenantID: tenants[0].id))
        tenants[0].menuItems.append(MenuItem(image: "pohon", name: "Menu 4", des: "Gambar pohon", price: "10.00", tenantID: tenants[0].id))
        
        // Tenant B
        
        
        // GOP 6
        // Tenant C
        tenants[2].menuItems.append(MenuItem(image: "logo", name: "Menu 1", des: "Logo utama", price: "10.00", tenantID: tenants[2].id))
        tenants[2].menuItems.append(MenuItem(image: "pohon", name: "Menu 2", des: "Gambar pohon", price: "10.00", tenantID: tenants[2].id))
        
        // Tenant D
        tenants[3].menuItems.append(MenuItem(image: "logo", name: "Menu 1", des: "Logo utama", price: "10.00", tenantID: tenants[3].id))
        tenants[3].menuItems.append(MenuItem(image: "pohon", name: "Menu 2", des: "Gambar pohon", price: "10.00", tenantID: tenants[3].id))
        
        // The Breeze
        tenants[4].menuItems.append(MenuItem(image: "logo", name: "Menu 1", des: "Logo utama", price: "10.00", tenantID: tenants[4].id))
        tenants[4].menuItems.append(MenuItem(image: "pohon", name: "Menu 2", des: "Gambar pohon", price: "10.00", tenantID: tenants[4].id))
        
        // Traveloka Campus
        tenants[5].menuItems.append(MenuItem(image: "logo", name: "Menu 1", des: "Logo utama", price: "10.00", tenantID: tenants[5].id))
        tenants[5].menuItems.append(MenuItem(image: "pohon", name: "Menu 2", des: "Gambar pohon", price: "10.00", tenantID: tenants[5].id))
    }
    
    func addMenu(to: Tenant, menus: [MenuItem]) {
        // set siapa tenantnya
        // looping menu dan append
    }
    
    
}


