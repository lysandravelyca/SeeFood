import SwiftUI

struct TenantDetailView: View {
    
    let location : Location
    let tenant: Tenant
    @ObservedObject var favoriteManager = FavoriteManager.shared
    @State private var alertMessage: String = ""
    @State private var showRedirectAlert = false
    @State private var isRedirecting = false
    
    var body: some View {
        
    NavigationStack {
            ScrollView {

                VStack(alignment: .leading, spacing: 16) {
                    
                    HStack {
                        
                        // Logo Tenant
                        Image(tenant.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            // Nama Tenant
                            Text(tenant.name)
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(.top)
                            
                            // Jam Operasional dan Kontak
                            Text(tenant.hour)
                            Text(tenant.phone)
                        }
                    }
                    
                    // Daftar Menu
                    if tenant.menuItems.isEmpty {
                        Text("Tidak ada menu tersedia")
                            .foregroundColor(.gray)
                            .italic()
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Menu:")
                                .font(.headline)
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
                                        
                                    }) {
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
            .navigationTitle("Detail Tenant")
            .navigationDestination(isPresented: $isRedirecting) {
                FavoriteMenuView()
            }
        }
    }
}


class FavoriteManager: ObservableObject {
    
    static let shared = FavoriteManager()
    var favoriteMenus: [MenuItem] = []
    
    private init() {}

    func addFavorite(menu: MenuItem) {
        if !favoriteMenus.contains(where: { $0.name == menu.name }) {
            favoriteMenus.append(menu)
        }
    }
    
    func removeFavorite(menu: MenuItem) {
        favoriteMenus.removeAll { $0.name == menu.name }
    }
    
    func isFavorite(menu: MenuItem) -> Bool {
        return favoriteMenus.contains(where: { $0.name == menu.name })
    }
}


func toggleFavorite(menu: MenuItem) -> Bool {
    if FavoriteManager.shared.isFavorite(menu: menu) {
        FavoriteManager.shared.removeFavorite(menu: menu)
        return false
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
