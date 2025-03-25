import SwiftUI

struct FavoriteMenuView: View {
    @ObservedObject var favoriteManager = FavoriteManager.shared
    var tenants = TenantData.shared.tenants
    
    @State private var showAlert = false
    @State private var selectedMenu: MenuItem?

    var body: some View {
        VStack(alignment: .leading) {
            Text("Favorite Menus")
                .font(.title)
                .bold()
                .padding()

            if favoriteManager.favoriteMenus.isEmpty {
                Text("No favorite menus yet.")
                    .foregroundColor(.gray)
                    .italic()
                    .padding()
            } else {
                // Mengelompokkan menu favorit berdasarkan tenantID
                let groupedMenus = Dictionary(grouping: favoriteManager.favoriteMenus, by: { $0.tenantID })
                
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
            }
        }
    }
}

#Preview {
    FavoriteMenuView()
}
