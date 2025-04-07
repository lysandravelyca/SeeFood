import SwiftUI

struct FavoriteMenuView: View {
    
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var favoriteManager = FavoriteManager.shared
    var tenants = TenantData.shared.tenants
    @State private var showAlert = false
    @State private var selectedMenu: MenuItem?

    var body: some View {
        
        ZStack {
            // Background Image
            Image("favoritemenuviewbg")
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
                    .padding(.bottom, 700)
                    .padding(.trailing,290)
            }
        
            VStack{
            
                if favoriteManager.favoriteMenus.isEmpty {
                    
                    Text("Favorite Menus")
                        .font(.title)
                        .bold()
                        
                    
                    Text("No favorite menus yet.")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .padding(.bottom ,20)
                    
                } else {
                    
                    let groupedMenus = Dictionary(grouping: favoriteManager.favoriteMenus, by: { menu in
                        TenantData.shared.tenants
                            .flatMap { $0.value }
                            .first { tenant in tenant.menuItems.contains(where: { $0.name == menu.name }) }?
                            .name ?? "Unknown"
                    })
                    
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Favorite Menus")
                                .font(.title)
                                .bold()
                                .padding(.top,30)
                            
//                            Text("The following menu is sorted by distance closest to you")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.gray)
//                                .padding(.bottom, 20)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) 
                        .padding(.horizontal, 50)
                        .padding(.top, 50)
                        
                        List {
                            ForEach(groupedMenus.keys.sorted(), id: \.self) { tenantName in
                                if let tenant = TenantData.shared.tenants
                                    .flatMap({ $0.value })
                                    .first(where: { $0.name == tenantName }) {
                                    
                                    Text(tenant.name)
                                        .font(.headline)
                                        .padding(.vertical, 5)
                                }
                                
                                // Menampilkan menu-menu dari tenant
                                ForEach(groupedMenus[tenantName] ?? [], id: \.menuId) { menu in
                                    HStack(spacing: 15) {
                                        Image(menu.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        VStack(alignment: .leading) {
                                            Text(menu.name)
                                                .font(.headline)
//                                            Text(menu.des)
//                                                .font(.subheadline)
//                                                .foregroundColor(.gray)
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
                                        .alert("Hapus Menu Favorit", isPresented: $showAlert) {
                                            Button("Yakin", role: .destructive) {
                                                if let menuToDelete = selectedMenu {
                                                    favoriteManager.removeFavorite(menu: menuToDelete)
                                                }
                                            }
                                            Button("Batal", role: .cancel) {}
                                        } message: {
                                            Text("Yakin mau hapus menu ini dari favorit?")
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
        .navigationBarHidden(true)
    }
}

#Preview {
    FavoriteMenuView()
}
