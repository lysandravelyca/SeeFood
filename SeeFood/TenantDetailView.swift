import SwiftUI

struct TenantDetailView: View {
    
    
    let tenant: Tenant
    @ObservedObject var favoriteManager = FavoriteManager.shared
    //    @State private var showAlert = false
    @State private var alertMessage: String = ""
    @State private var showRedirectAlert = false
    @State private var isRedirecting = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("tenantdetailviewbg") // Replace with your actual image name
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, -200)
                
                ScrollView {
                    VStack {
                        // Nama Tenant
                        Text(tenant.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text("GOP 9")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(.gray)
                            .multilineTextAlignment(.center)
                        
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            // Logo Tenant
                            Image("tenantkasturi")
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
                                    HStack(spacing: 15) {
                                        // Gambar Menu
                                        Image(tenant.menuItems[index].image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 130, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
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
                .navigationTitle("")
                .navigationDestination(isPresented: $isRedirecting) {
                    FavoriteMenuView()
                }
            }
        }
    }
    }
    
    
    class FavoriteManager: ObservableObject {
        static let shared = FavoriteManager()
        
        @Published private(set) var favoriteMenus: [MenuItem] = []
        
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
    
    
    private func toggleFavorite(menu: MenuItem) -> Bool {
        if FavoriteManager.shared.isFavorite(menu: menu) {
            FavoriteManager.shared.removeFavorite(menu: menu)
            return false
        } else {
            FavoriteManager.shared.addFavorite(menu: menu)
            return true
        }
    }


#Preview {
    TenantDetailView(tenant: Tenant(
        name: "Kasturi",
        image: "Sample Image",
        menuItems: [
            MenuItem(image: "foto_menu", name: "Menu Spesial", des: "Makanan enak!", price: "15.00", tenantID: UUID()),
            MenuItem(image: "pohon", name: "Minuman Segar", des: "Dingin & menyegarkan", price: "5.00", tenantID: UUID())
        ],
        price: 10,
        hour: "10.00",
        phone: "nomor hp",
        locationID: UUID()
    ))
}
