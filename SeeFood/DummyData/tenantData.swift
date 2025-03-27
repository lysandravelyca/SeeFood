//
//  tenantData.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import Foundation

class TenantData {
    static let shared = TenantData()
        
        var tenants: [String: [Tenant]]
        
    private init() {
        let locations = LocationData.shared.locations
        
        tenants = [
            
            "The Breeze": [
                Tenant(name: "RM Padang Salero", image: "RM", menuItems: [
                    
                    MenuItem(image: "RM-1", name: "Dadar Barendo", des: "Telur dadar dengan bumbu Minang", price: "Rp 12.000"),
                    MenuItem(image: "RM-2", name: "Rendang Daging", des: "Daging sapi dengan bumbu khas Padang", price: "Rp 15.000"),
                    MenuItem(image: "RM-3", name: "Ayam Pop", des: "Ayam rebus dengan sambal merah", price: "Rp 17.000"),
                    MenuItem(image: "RM-4", name: "Gulai Tunjang", des: "Kikil sapi dengan kuah santan", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Mama Djempol", image: "MD", menuItems: [
                    
                    MenuItem(image: "MD-1", name: "Ayam Sambel Bawang", des: "Nasi ayam sambal bawang pedas", price: "Rp 12.000"),
                    MenuItem(image: "MD-2", name: "Lele Goreng Kremes", des: "Lele goreng renyah dengan kremesan", price: "Rp 15.000"),
                    MenuItem(image: "MD-3", name: "Tempe Penyet", des: "Tempe goreng dengan sambal ulek", price: "Rp 17.000"),
                    MenuItem(image: "MD-4", name: "Nasi Uduk Komplit", des: "Nasi uduk dengan ayam, orek, dadar dan kacang", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Warkop Indra", image: "Wkp", menuItems: [
                    
                    MenuItem(image: "W-1", name: "Indomie Rebus Spesial", des: "Indomie rebus dengan telur, sosis, dan kornet", price: "Rp 12.000"),
                    MenuItem(image: "W-2", name: "Kopi Tubruk", des: "Kopi hitam khas Warkop Indra", price: "Rp 15.000"),
                    MenuItem(image: "W-3", name: "Roti Bakar Coklat Keju", des: "Roti bakar dengan isian coklat dan keju", price: "Rp 17.000"),
                    MenuItem(image: "W-4", name: "Pisang Goreng Karamel", des: "Pisang goreng dengan lelehan karamel", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Nasi Rames Bu Imas", image: "NR", menuItems: [
                    
                    MenuItem(image: "NR-1", name: "Nasi Rame Komplit", des: "Nasi dengan ayam, tahu, tempe, sayur, dan sambal", price: "Rp 12.000"),
                    MenuItem(image: "NR-2", name: "Nasi Kuning Komplit", des: "Nasi kuning dengan ayam, telur, tahu, tempe, dan sambal", price: "Rp 15.000"),
                    MenuItem(image: "NR-3", name: "Tumis Kangkung", des: "Kangkung yang ditumis dengan bawang putih dan cabai", price: "Rp 17.000"),
                    MenuItem(image: "NR-4", name: "Perkedel Kentang", des: "Perkedel kentang lembut dengan bumbu spesial", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Uena", image: "Uena", menuItems: [
                    
                    MenuItem(image: "U-1", name: "Ayam Bakar Madu", des: "Ayam bakar dengan bumbu madu", price: "Rp 12.000"),
                    MenuItem(image: "U-2", name: "Sate Taichan", des: "Sate ayam tanpa bumbu kacang", price: "Rp 15.000"),
                    MenuItem(image: "U-3", name: "Nasi Goreng Kampung", des: "Nasi goreng dengan bumbu khas", price: "Rp 17.000"),
                    MenuItem(image: "U-4", name: "Es Teh Tarik", des: "Es teh dengan kental manis", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Roti Bakar Tangerang", image: "RB", menuItems: [
                    
                    MenuItem(image: "RB-1", name: "Roti Bakar Nutella", des: "Roti bakar dengan olesan nutella", price: "Rp 12.000"),
                    MenuItem(image: "RB-2", name: "Roti Bakar Susu Coklat", des: "Roti bakar dengan susu coklat", price: "Rp 15.000"),
                    MenuItem(image: "RB-3", name: "Pisang Bakar Keju", des: "Pisang bakar bertabur keju", price: "Rp 17.000"),
                    MenuItem(image: "RB-4", name: "Es Milo Dino", des: "Es milo dengan coklat bubuk melimpah", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
                Tenant(name: "Nasi Kapau Bundo Kito", image: "NK", menuItems: [
                    
                    MenuItem(image: "NK-1", name: "Gulai Tambusu", des: "Usus sapi dengan isi tahu dan telur", price: "Rp 12.000"),
                    MenuItem(image: "NK-2", name: "Ikan Asam Padeh", des: "Kopi susu segar", price: "Rp 15.000"),
                    MenuItem(image: "NK-3", name: "Dendeng Batokok", des: "Kopi susu gula aren", price: "Rp 17.000"),
                    MenuItem(image: "NK-4", name: "Sayur Kapau", des: "Coklat dengan susu segar", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[2].id),
                
            ]
        ]
    }
}
