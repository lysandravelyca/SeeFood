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
        
            VStack{
            
                if favoriteManager.favoriteMenus.isEmpty {
                    
                    Text("Feeling hungry? ")
                        .font(.title)
                        .bold()
                        
                    
                    Text("Add your favorite menu to get started!")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.bottom ,20)
                        .frame(maxWidth: 350)
                        
                    
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
                            Text("Done eating? Swipe left to keep track!")
                                .foregroundColor(.gray)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 50)
                        
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

                                            Text("\(menu.price)")
                                                .font(.subheadline)
                                                .bold()
                                        }
                                        
                                        Spacer()
                                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                Button {
                                                    favoriteManager.removeFavorite(menu: menu)
                                                } label: {
                                                    Label("Complete", systemImage: "checkmark.seal.fill")
                                                }
                                                .tint(.green) 
                                            }

                                        
                                    }
                                    .padding(.vertical, 5)
                                }
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .padding (.horizontal, 40)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(Color.black)
                        .padding(.leading, 18)
                }
            }
        }
    }
}

#Preview {
    FavoriteMenuView()
}
