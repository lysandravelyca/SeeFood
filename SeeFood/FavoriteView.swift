import SwiftUI

struct FavoriteMenuView: View {
    @ObservedObject var favoriteManager = FavoriteManager.shared
    var tenants = TenantData.shared.tenants
    
    @State private var showAlert = false
    @State private var selectedMenu: MenuItem?

    var body: some View {
        ZStack {
            // Background Image
            Image("favoritemenuviewbg") // Replace with your actual image name
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .padding(.bottom, -200)
            
            VStack {
               

                if favoriteManager.favoriteMenus.isEmpty {
                    VStack {
                        Text("Favorite Menus")
                            .font(.title)
                            .bold()
                            
                        Text("No favorite menus yet.")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.bottom ,20)
                    }
                    
                } else {
                    // Mengelompokkan menu favorit berdasarkan tenantID
                    let groupedMenus = Dictionary(grouping: favoriteManager.favoriteMenus, by: { $0.tenantID })
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Favorite Menus")
                                .font(.title)
                                .bold()
                            
                            Text("The following menu is sorted by distance closest to you")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .padding(.bottom, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Ensures it stays within screen bounds
                        .padding(.horizontal, 50) // Optional: Adds some spacing from edges
                        .padding(.top, 50)
                        
                        List {
                            ForEach(groupedMenus.keys.sorted(), id: \.self) { tenantID in
                                if let tenant = tenants.first(where: { $0.id == tenantID }) {
                                    // Menampilkan Nama Tenant hanya sekali d
                                    Text(tenant.name)
                                        .font(.headline)
                                        .padding(.vertical, 5)
                                }
                                
                                // Menampilkan menu-menu dari tenant
                                ForEach(groupedMenus[tenantID] ?? [], id: \.menuId) { menu in
                                    HStack(spacing: 15) {
                                        Image(menu.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))

                                        VStack(alignment: .leading) {
                                            Text(menu.name)
                                                .font(.headline)
                                            Text(menu.des)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                            Text("Harga: \(menu.price)")
                                                .font(.subheadline)
                                                .bold()
                                        }

                                        Spacer()
                                        
                                        Button(action: {
                                            selectedMenu = menu
                                            showAlert = true
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                        .alert("Hapus Favorit", isPresented: $showAlert) {
                                            Button("Hapus", role: .destructive) {
                                                if let menuToDelete = selectedMenu {
                                                    favoriteManager.removeFavorite(menu: menuToDelete)
                                                }
                                            }
                                            
                                            Button("Batal", role: .cancel) {}
                                        } message: {
                                            Text("Apakah Anda yakin ingin menghapus menu ini dari favorit?")
                                        }
                                    }
                                    .padding(.vertical, 5)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden) // Removes extra background spacing
                        .padding (.horizontal, 40)
                    }
                }
            }
        }
        
        
    }
}

#Preview {
//    let previewManager = FavoriteManager.shared
//
//    // Use addFavorite to inject data
//    previewManager.addFavorite(menu: MenuItem(image: "sample_food_1", name: "Nasi Goreng Spesial", des: "Nasi goreng dengan ayam, udang, dan telur.", price: "25.000", tenantID: UUID()))
//    
//    previewManager.addFavorite(menu: MenuItem(image: "sample_food_2", name: "Mie Ayam Bakso", des: "Mie ayam dengan tambahan bakso sapi.", price: "20.000", tenantID: UUID()))
    return FavoriteMenuView()
}
