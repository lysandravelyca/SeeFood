import Foundation

class TenantData {
    static let shared = TenantData()
        
        var tenants: [String: [Tenant]]
        
    private init() {
        let locations = LocationData.shared.locations
        
        tenants = [
            "GOP 9": [
                Tenant(name: "Alfamart", image: "A", menuItems: [
                    
                    MenuItem(image: "A1", name: "Americano", des: "Kopi hitam tanpa gula", price: "Rp 12.000"),
                    MenuItem(image: "A2", name: "Caffe Latte", des: "Kopi susu segar", price: "Rp 15.000"),
                    MenuItem(image: "A3", name: "Aren Latte", des: "Kopi susu gula aren", price: "Rp 17.000"),
                    MenuItem(image: "A4", name: "Chocolate", des: "Coklat dengan susu segar", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "-", locationID: locations[0].id),
                
                Tenant(name:"Kasturi" , image: "K", menuItems:[
                
                    
                    MenuItem(image: "K1", name: "Nasi + ayam + sayur", des: "ayam teriyaki,toge", price: "Rp17.000"),
                    MenuItem(image: "K2", name: "Nasi + ikan + sayur", des: "ikan cakalang suwir, pok coy", price: "Rp15.000"),
                    MenuItem(image: "K3", name: "Nasi + gorengan + sayur", des: "martabak telur, krecek", price: "Rp12.000"),
                    MenuItem(image: "K4", name: "Nasi + ikan + ayam", des: "ikan asam manis,ayam rica", price: "Rp20.000"),
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 13.00", phone: "082345871200", locationID: locations[0].id),
                
                Tenant(name: "Mama Djempol", image: "M", menuItems: [
                    
                    MenuItem(image: "M1", name: "Lauk Daging", des: "ayam gulai,sapi lada hitam", price: "Rp 18.000"),
                    MenuItem(image: "M2", name: "Aneka Sayur", des: "kangkung,toge,sawi", price: "Rp 8.000"),
                    MenuItem(image: "M3", name: "Lauk Tambahan", des: "terong baldo, tempe, tahu", price: "Rp 5.000"),
                    MenuItem(image: "M4", name: "Nasi Putih", des: "satu porsi", price: "Rp 3.000")
                    
                ], price: "Rp 3.000 - Rp 20.000", hour: "08.00 - 13.00", phone: "087632019988", locationID: locations[0].id),
                
                Tenant(name: "RM Padang", image: "R", menuItems: [
                    
                    MenuItem(image: "R1", name: "Rendang Sapi Khas Padang", des: "Daging sapi dimasak santan dan rempah", price: "Rp 25.000"),
                    
                    MenuItem(image: "R2", name: "Ayam Pop", des: "Ayam kampung rebus dengan bumbu khas minang", price: "Rp 21.000"),
                    
                    MenuItem(image: "R3", name: "Dendeng Balado", des: "Daging sapi sambal balado pedas manis", price: "Rp 24.000"),
                    
                    MenuItem(image: "R4", name: "Gulai Kepala Ikan", des: "Kepala ikan kakap dimasak kuah gulai santan kental", price: "Rp 30.000")
                   
                    
                ], price: "Rp21.000 - Rp30.000", hour: "08.00 - 13.000", phone: "0127854679877", locationID: locations[0].id),
                
                
                Tenant(name: "Soto Pak Gembul", image: "S", menuItems: [
                    
                    
                    MenuItem(image: "S1", name: "Soto Ayam Kampung", des: "Soto ayam kuah bening, telur rebus, soun", price: "Rp 25.000"),
                    
                    MenuItem(image: "S2", name: "Soto Daging Sapi", des: "Soto daging sapi, kuah kuning, tomat, tauge, dan emping.", price: "Rp 30.000"),
                    
                    MenuItem(image: "S3", name: "Soto Babat Campur", des: " babat dan daging sapi dalam kuah santan, jeruk nipis", price: "Rp 28.000"),
                    
                    MenuItem(image: "S4", name: "Soto Ceker Special", des: "Soto ceker ayam,soun, kol, dan kerupuk udang", price: "Rp 22.000")
                    
                    
                ], price: "Rp 22.000 - Rp 30.000", hour: "08.00 - 13.00", phone: "082436178533", locationID: locations[0].id),
                
                
                Tenant(name: "Warteg Nusantara", image: "W", menuItems: [
                    
                    MenuItem(image: "W1", name: "Nasi Campur Nusantara", des: "Nasi ayam goreng kremes, tempe orek, sambal terasi", price: "Rp 25.000"),
                    
                    MenuItem(image: "W2" , name: "Nasi Rendang Padang Istimewa", des: "Daging sapi dengan nasi putih dan lalapan.", price: "Rp 30.000"),
                    
                    MenuItem(image: "W3", name: "Nasi Tahu Telur Bumbu Kacang", des: "Tahu goreng, telur dadar dengan saus kacang manis pedas.", price: "Rp 20.000"),
                    
                    MenuItem(image: "W4", name: "Nasi Ikan Goreng Sambal Matah", des: "Ikan kembung goreng, sambal matah, nasi dan sayur urap.", price: "Rp 28.000")
                    
                ], price: "Rp 20.000 - Rp 30.000", hour: "08.00 - 13.00", phone: "089745321788", locationID: locations[0].id)
            ],
            
            "GOP 6": [
                
                Tenant(name: "Nasi Kapau", image: "NK", menuItems: [
                    
                    MenuItem(image: "NK1", name: "Rendang Dagimg", des: "Daging sapi dengan bumbu khas Minang.", price: "Rp 35.000"),
                    MenuItem(image: "NK2", name: "Dendeng Batokok", des: "Irisan tipis daging sapi dengan sambal hijau.", price: "Rp 30.000"),
                    MenuItem(image: "NK3", name: "Ayam Pop", des: "Ayam rebus dengan bumbu gurih alami.", price: "Rp 20.000"),
                    MenuItem(image: "NK4", name: "Telur Dadar Padang", des: "Telur dadar dengan bumbu khas Padang.", price: "Rp 18.000"),
                    MenuItem(image: "NP", name: "Nasi Kapau", des: "Nasi putih khas Minang.", price: "Rp 22.000")
    
                ], price: "Rp 15.000 - Rp 35.000", hour: "08.00 - 17.00", phone: "089743217755", locationID: locations[1].id),
                
                Tenant(name: "Warkop Paris", image: "WP", menuItems: [
                    
                    MenuItem(image: "WP1", name: "Kopi Hitam Tubruk", des: "Kopi hitam tanpa ampas untuk penikmat kopi.", price: "Rp 35.000"),
                    MenuItem(image: "WP2", name: "Roti Bakar Paris", des: "Roti bakar dengan bumbu rahasia dari Paris.", price: "Rp 15.000"),
                    MenuItem(image: "WP3", name: "Mie Instan Original", des: "Mie instan yang rasanya nendang.", price: "Rp 20.000"),
                    MenuItem(image: "WP4", name: "Nasi Goreng Rempah", des: "Nasi goreng dengan bumbu rempah yang nikmat.", price: "Rp 18.000"),
                    MenuItem(image: "WP5", name: "Es Teh Lemon Madu", des: "Es teh dengan potongan lemon dan madu.", price: "Rp 22.000")
    
                ], price: "Rp 15.000 - Rp 35.000", hour: "08.00 - 17.00", phone: "089743217755", locationID: locations[1].id),
                
                Tenant(name: "Nasi Hainam", image: "NH", menuItems: [
                    
                    MenuItem(image: "NH1", name: "NH Ayam Rebus", des: "Nasi bumbu khas dengan ayam rebus yang lembut.", price: "Rp 35.000"),
                    MenuItem(image: "NH2", name: "NH Ayam Panggang", des: "Nasi bumbu khas dengan ayam panggang yanng gurih.", price: "Rp 15.000"),
                    MenuItem(image: "NH3", name: "NH Bebek Panggang", des: "Nasi bumbu khas dengan bebek panggang yang gurih.", price: "Rp 20.000"),
                    MenuItem(image: "NH4", name: "NH Seafood", des: "Nasi bumbu khas dengan udang, cumi, dan ikan tumis.", price: "Rp 18.000"),
    
                ], price: "Rp 15.000 - Rp 35.000", hour: "08.00 - 17.00", phone: "089743217755", locationID: locations[1].id),
                
                Tenant(name: "Lawson", image: "L", menuItems: [
                    
                    MenuItem(image: "L1", name: "Chicken Katsu Bento", des: "Nasi dengan ayam katsu crispy, saus tonkatsu, salad segar, dan telur dadar.", price: "Rp 35.000"),
                    MenuItem(image: "L2", name: "Onigiri Tuna Mayo", des: "Nasi kepal khas Jepang dengan isian tuna mayo creamy, dibungkus dengan nori renyah.", price: "Rp 15.000"),
                    MenuItem(image: "L3", name: "Oden Combo", des: "Pilihan fishcake, tahu isi, dan bakso ikan dalam kuah kaldu Jepang hangat.", price: "Rp 20.000"),
                    MenuItem(image: "L4", name: "Es Kopi Susu Gula Aren", des: "Perpaduan kopi espresso, susu segar, dan gula aren yang manis alami.", price: "Rp 18.000"),
                    MenuItem(image: "L5", name: "Es Coklat Jepang", des: "Minuman coklat kental dengan rasa khas kakao Jepang.", price: "Rp 22.000")
    
                ], price: "Rp 15.000 - Rp 35.000", hour: "08.00 - 17.00", phone: "089743217755", locationID: locations[1].id)
            ],
            
            "Traveloka Campus": [
                
                Tenant(name: "Dapur Kencana", image: "D", menuItems: [
                    MenuItem(image: "D1", name: "Nasi Liwet Komplit", des: "Nasi liwet gurih dengan ayam , tahu tempe, sambal, dan lalapan.", price: "Rp 35.000"),
                    MenuItem(image: "D2", name: "Nasi Gudeg Kencana", des: "Gudeg nangka khas Jogja dengan krecek pedas, ayam opor, dan telur bacem.", price: "Rp 32.000"),
                    MenuItem(image: "D3", name: "Ayam Bakar Madu", des: "Nasi ayam panggang bumbu madu manis gurih.", price: "Rp 25.000"),
                    MenuItem(image: "D4", name: "Tahu & Tempe Bacem", des: "Tahu dan tempe yang dimasak dengan gula merah dan rempah, manis dan gurih.", price: "Rp 12.000")
                    
                ], price: "Rp 12.000 - Rp 35.000", hour: "08.00 - 13.00", phone: "089543281177", locationID: locations[3].id),
                
                Tenant(name: "Family Mart", image: "F", menuItems: [
                    MenuItem(image: "F1", name: "Karaage Don", des: "Nasi dengan ayam goreng karaage renyah, disajikan dengan mayones pedas dan nori.", price: "Rp 23.000"),
                    MenuItem(image: "F2", name: "Beef Yakiniku Bento", des: "Nasi dengan daging sapi tumis saus yakiniku, lengkap dengan sayur dan telur.", price: "Rp 28.000"),
                    MenuItem(image: "F3", name: "Onigiri Salmon Mentai", des: "Nasi kepal dengan isian salmon dan saus mentai gurih, dibakar hingga harum.", price: "Rp 18.000"),
                    MenuItem(image: "F4", name: "Soft Cream Matcha", des: "Es krim matcha dengan rasa teh hijau yang autentik dan creamy.", price: "Rp 12.000"),
                    MenuItem(image: "F5", name: "Yakult Lemonade", des: "Minuman segar perpaduan Yakult dengan air lemon, kaya vitamin C.", price: "Rp 17.000")
                    
                ], price: "Rp 12.000 - Rp 28.000", hour: "08.00 - 17.00", phone: "089532281177", locationID: locations[3].id)
                ],
            
            "The Breeze": [
                Tenant(name: "RM Padang Salero", image: "RM", menuItems: [
                    
                    MenuItem(image: "RM-1", name: "Dadar Barendo", des: "Telur dadar dengan bumbu Minang", price: "Rp 12.000"),
                    MenuItem(image: "RM-2", name: "Rendang Daging", des: "Daging sapi dengan bumbu khas Padang", price: "Rp 15.000"),
                    MenuItem(image: "RM-3", name: "Ayam Pop", des: "Ayam rebus dengan sambal merah", price: "Rp 17.000"),
                    MenuItem(image: "RM-4", name: "Gulai Tunjang", des: "Kikil sapi dengan kuah santan", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "0895432819890", locationID: locations[2].id),
                
                Tenant(name: "Mama Djempol", image: "M", menuItems: [
                    
                    MenuItem(image: "MD-1", name: "Ayam Sambel Bawang", des: "Nasi ayam sambal bawang pedas", price: "Rp 12.000"),
                    MenuItem(image: "MD-2", name: "Lele Goreng Kremes", des: "Lele goreng renyah dengan kremesan", price: "Rp 15.000"),
                    MenuItem(image: "MD-3", name: "Tempe Penyet", des: "Tempe goreng dengan sambal ulek", price: "Rp 17.000"),
                    MenuItem(image: "MD-4", name: "Nasi Uduk Komplit", des: "Nasi uduk dengan ayam, orek, dadar dan kacang", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "089543284762", locationID: locations[2].id),
                
                Tenant(name: "Warkop Indra", image: "Wkp", menuItems: [
                    
                    MenuItem(image: "W-2", name: "Indomie Rebus Spesial", des: "Indomie rebus dengan telur, sosis, dan kornet", price: "Rp 12.000"),
                    MenuItem(image: "W-1", name: "Kopi Tubruk", des: "Kopi hitam khas Warkop Indra", price: "Rp 15.000"),
                    MenuItem(image: "W-4", name: "Roti Bakar Coklat Keju", des: "Roti bakar dengan isian coklat dan keju", price: "Rp 17.000"),
                    MenuItem(image: "W-3", name: "Pisang Goreng Karamel", des: "Pisang goreng dengan lelehan karamel", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "089543983473", locationID: locations[2].id),
                
                Tenant(name: "Nasi Rames Bu Imas", image: "NR6", menuItems: [
                    
                    MenuItem(image: "NR-1", name: "Nasi Rames Komplit", des: "Nasi dengan ayam, tahu, tempe, sayur, dan sambal", price: "Rp 12.000"),
                    MenuItem(image: "NR-2", name: "Nasi Kuning Komplit", des: "Nasi kuning dengan ayam, telur, tahu, tempe, dan sambal", price: "Rp 15.000"),
                    MenuItem(image: "NR-3", name: "Tumis Kangkung", des: "Kangkung yang ditumis dengan bawang putih dan cabai", price: "Rp 17.000"),
                    MenuItem(image: "NR-4", name: "Perkedel Kentang", des: "Perkedel kentang lembut dengan bumbu spesial", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "08954328009", locationID: locations[2].id),
                
                Tenant(name: "Uena", image: "Uena", menuItems: [
                    
                    MenuItem(image: "U-2", name: "Ayam Bakar Madu", des: "Ayam bakar dengan bumbu madu", price: "Rp 12.000"),
                    MenuItem(image: "U-4", name: "Sate Taichan", des: "Sate ayam tanpa bumbu kacang", price: "Rp 15.000"),
                    MenuItem(image: "U-1", name: "Nasi Goreng Kampung", des: "Nasi goreng dengan bumbu khas", price: "Rp 17.000"),
                    MenuItem(image: "U-3", name: "Es Teh Tarik", des: "Es teh dengan kental manis", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "089543281100", locationID: locations[2].id),
                
                Tenant(name: "Roti Bakar Tangerang", image: "RB", menuItems: [
                    
                    MenuItem(image: "RB-1", name: "Roti Bakar Nutella", des: "Roti bakar dengan olesan nutella", price: "Rp 12.000"),
                    MenuItem(image: "RB-4", name: "Roti Bakar Susu Coklat", des: "Roti bakar dengan susu coklat", price: "Rp 15.000"),
                    MenuItem(image: "RB-2", name: "Pisang Bakar Keju", des: "Pisang bakar bertabur keju", price: "Rp 17.000"),
                    MenuItem(image: "RB-3", name: "Es Milo Dino", des: "Es milo dengan coklat bubuk melimpah", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "0895430980177", locationID: locations[2].id),
                
                Tenant(name: "Nasi Kapau Bundo Kito", image: "NKA", menuItems: [
                    
                    MenuItem(image: "NKA-1", name: "Gulai Tambusu", des: "Usus sapi dengan isi tahu dan telur", price: "Rp 12.000"),
                    MenuItem(image: "NKA-3", name: "Ikan Asam Padeh", des: "Kopi susu segar", price: "Rp 15.000"),
                    MenuItem(image: "NKA-4", name: "Dendeng Batokok", des: "Kopi susu gula aren", price: "Rp 17.000"),
                    MenuItem(image: "NKA-2", name: "Sayur Kapau", des: "Coklat dengan susu segar", price: "Rp 15.000")
                    
                    
                ], price: "Rp12.00 - Rp20.000", hour: "08.00 - 17.00", phone: "0895438478374", locationID: locations[2].id),
                
            ]
        ]
    }
}
