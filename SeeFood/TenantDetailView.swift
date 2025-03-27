import SwiftUI

struct TenantDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let location : Location
    let tenant: Tenant
    @ObservedObject var favoriteManager = FavoriteManager.shared
    @State private var alertMessage: String = ""
    @State private var showRedirectAlert = false
    @State private var isRedirecting = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // Background Image
                Image("tenantdetailviewbg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, -200)
                
                Button{
                    // action animasi back
                    dismiss()
                    
                } label: {
                    Image(systemName: "chevron.left") // SF symbbol
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .frame(width: 45, height: 45)
                        .background(.white)
                        .clipShape(Circle())
                        .overlay(
                               Circle()
                                .stroke(Color.gray.opacity(0.8), lineWidth: 1)
                           )
                        .padding(.bottom, 730)
                        .padding(.trailing,290)
                }
                
                ScrollView {
                    
                    VStack{
                        
                        
                        Text(tenant.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(location.name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.bottom,20)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Image(tenant.image)
                                .resizable()
                                .scaledToFill() // Ensures the image fills the frame without distortion
                                .frame(width: 353, height: 172) // Defines the exact size
                                .clipShape(RoundedRectangle(cornerRadius: 10)) // Clips the image
                                .overlay( // Adds a gray border
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2))
                                .clipped() // Ensures anything outside the frame is hidden
                            
                            Spacer()
                            
                            // Jam Operasional, Kontak, dan Harga
                            HStack {
                                Image(systemName: "clock")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text(tenant.hour)
                                    .fontWeight(.semibold)
                            }
                            
                            HStack {
                                Image(systemName: "phone.fill")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text(tenant.phone)
                                    .fontWeight(.semibold)
                            }
                            
                            HStack {
                                Image(systemName: "dollarsign")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text("Rp15.000 - Rp25.000")
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                        }
                                                       
                            
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                // Daftar Menu
                                if tenant.menuItems.isEmpty {
                                    Text("Tidak ada menu tersedia")
                                        .foregroundColor(.gray)
                                        .italic()
                                } else {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Menu:")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .padding(.bottom, 5)
                                        
                                        // Iterasi menu
                                        ForEach(tenant.menuItems.indices, id: \.self) { index in
                                            HStack() {
                                                // Gambar Menu
                                                Image(tenant.menuItems[index].image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 130, height: 100)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                
                                                Spacer()
                                                // Deskripsi Menu
                                                VStack(alignment: .leading, spacing: 5) {
                                                    Text(tenant.menuItems[index].name)
                                                        .font(.headline)
                                                    
                                                    Text(tenant.menuItems[index].des)
                                                        .font(.subheadline)
                                                        .foregroundColor(.gray)
                                                
                                                    Text("Harga: \(tenant.menuItems[index].price)")
                                                        .font(.subheadline)
                                                        .bold()
                                                }
                                                Spacer()
                                                
                                                // Toggle Favorite
                                                Button(action: {
                                                    let isNowFavorite = toggleFavorite(menu: tenant.menuItems[index])
                                                    alertMessage = isNowFavorite ? "Menu telah ditambahkan ke daftar favorit." : "Menu telah dihapus dari daftar favorit."
                                                    
                                                    if isNowFavorite {
                                                        showRedirectAlert = true
                                                    }
                                                    
                                                }){
                                                    Image(systemName: favoriteManager.isFavorite(menu: tenant.menuItems[index]) ? "star.fill" : "star")
                                                        .font(.system(size: 24))
                                                        .foregroundColor(favoriteManager.isFavorite(menu: tenant.menuItems[index]) ? .yellow : .gray)
                                                }
                                                .alert(isPresented: $showRedirectAlert) {
                                                    Alert(
                                                        title: Text("Menu Ditambahkan!"),
                                                        message: Text("Apakah Anda ingin melihat daftar favorit?"),
                                                        primaryButton: .default(Text("Ya"), action: {
                                                            isRedirecting = true // Mengarahkan ke FavoriteMenuView
                                                        }),
                                                        secondaryButton: .cancel(Text("Tidak"))
                                                    )
                                                }
                                            }
                                            .frame(width: 350)
                                            .padding(.vertical, 10)
                                            
                                            if index < tenant.menuItems.count - 1 {
                                                Divider()
                                                    .background(Color.gray)
                                                    .padding(.horizontal, -10)
                                            }
                                        }
                                    }
                                }
                                
                            }
                            .padding()
                            .frame(width: 380)
                            .frame(maxWidth: .infinity)
                        }
                        .navigationDestination(isPresented: $isRedirecting) {
                            FavoriteMenuView()
                        }
                    }
                }
            }
        .navigationBarHidden(true)
        }
    }



class FavoriteManager: ObservableObject {
    
    static let shared = FavoriteManager()
    
    // array yg simpen menu yg di favoritin
    var favoriteMenus: [MenuItem] = []
    
     init() {}

    func addFavorite(menu: MenuItem) {
        if !favoriteMenus.contains(where: { $0.name == menu.name }) {
            favoriteMenus.append(menu)
        }
    }
    
    func removeFavorite(menu: MenuItem) {
        favoriteMenus.removeAll { $0.name == menu.name }
    }
    
    // kalo ada
    func isFavorite(menu: MenuItem) -> Bool {
        return favoriteMenus.contains(where: { $0.name == menu.name })
    }
}


func toggleFavorite(menu: MenuItem) -> Bool {
    
    // klo ada return di remove
    if FavoriteManager.shared.isFavorite(menu: menu) {
        FavoriteManager.shared.removeFavorite(menu: menu)
        return false
        
    // klo gada di add
    } else {
        FavoriteManager.shared.addFavorite(menu: menu)
        return true
    }
}

#Preview {
    TenantDetailView(
        location: Location(
            name: "gop 9",
            latitude: 100,
            longitude: 200, image: "sample image" ),
      
        tenant: Tenant(
            name: "Kasturi",
            image: "sample_image",
            menuItems: [
                MenuItem(image: "foto_menu", name: "Menu Spesial", des: "Makanana dengan ayam dan sayur mantap gacor", price: "15.00"),
                MenuItem(image: "pohon", name: "Minuman Segar", des: "Dingin & menyegarkan", price: "5.00")
            ], price: "789",
            hour: "10:00 - 22:00",
            phone: "08123456789",
            locationID: UUID()
        )
    )
}
