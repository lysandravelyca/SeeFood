import SwiftUI


struct TenantDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    let location : Location
    let tenant: Tenant
    @ObservedObject var favoriteManager = FavoriteManager.shared
    @State private var alertMessage: String = ""
    @State private var showRedirectAlert = false
    @State private var isRedirecting = false
    
    @State private var showToast = false
    @State private var toastMessage = ""
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("tenantdetailviewbg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .padding(.bottom, -200)
                
                ScrollView {
                    
                    HStack(alignment: .center) {
                     
                        Spacer() // Menambahkan Spacer() untuk mendorong VStack ke tengah
                        VStack {
                            Text(tenant.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .frame(width: 200)
                            
                        }
                        Spacer()

                    }
                    .padding(.horizontal,45)
                    
                    HStack {
                        
                        Image(tenant.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 155, height: 155)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 2))
                            .clipped()
                        
                        
                        // Jam Operasional, Kontak, dan Harga
                        VStack(alignment: .leading){
                            HStack {
                                Image(systemName: "clock")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text(tenant.hour)
                                    .font(.system(size: 14))
                               
                            }
                            
                            HStack {
                                Image(systemName: "phone.fill")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text(tenant.phone)
                                    .font(.system(size: 14))
                   
                            }
                            
                            HStack {
                                Image(systemName: "dollarsign")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.green)
                                    .frame(width: 30, height: 30)
                                Text("Rp15.000 - Rp25.000")
                                    .font(.system(size: 14))
                                
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        // Daftar Menu
                        if tenant.menuItems.isEmpty {
                            Text("Tidak ada menu yang tersedia")
                                .foregroundColor(.gray)
                                .italic()
                        } else {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Menu")
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
                                    
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text(tenant.menuItems[index].name)
                                                .font(.headline)
                                            
                                            
                                            Text("\(tenant.menuItems[index].price)")
                                                .font(.subheadline)
                                                .bold()
                                        }
                                        Spacer()
                                        
                                        // Toggle Favorite
                                        Button(action: {
                                     
                                            let isNowFavorite = toggleFavorite(menu: tenant.menuItems[index])
                                            toastMessage = isNowFavorite ? "Menu added to favorites!" : "Menu removed from favorites!"
                                            withAnimation {
                                                showToast = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                withAnimation {
                                                    showToast = false
                                                }
                                            }
                                  
                                            
                                        }){
                                            Image(systemName: favoriteManager.isFavorite(menu: tenant.menuItems[index]) ? "star.fill" : "star")
                                                .font(.system(size: 24))
                                                .foregroundColor(favoriteManager.isFavorite(menu: tenant.menuItems[index]) ? .yellow : .gray)
                                                                         
                                        }
                                    }
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
                if showToast {
                    VStack {
                        Spacer()
                        
                        HStack(spacing: 12) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.white)
                            
                            Text(toastMessage)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                                .lineLimit(2)
                            
                            Spacer()
                            
                            Button(action: {
                                isRedirecting = true
                                showToast = false
                            }) {
                                Text("view")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.black.opacity(0.75))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3)
                        .padding(.horizontal, 16)
                    }
                    .padding(20)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut, value: showToast)
                }
                
            }
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundStyle(Color.black)
                        
                    }
                    .padding(.leading,18)
                }
            }
            
        }
    }
}


class FavoriteManager: ObservableObject {
    
    static let shared = FavoriteManager()
    
    // array yg simpen menu yg di favoritin
    @Published var favoriteMenus: [MenuItem] = []
    
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
