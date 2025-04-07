import SwiftUI
import MapKit



struct ContentView: View {

    @ObservedObject var favoriteManager = FavoriteManager.shared
    
    
    let locations = LocationData.shared.locations
    
    //atur ambil map yg di coor mana
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -6.301763, longitude: 106.652762),
            span: MKCoordinateSpan(latitudeDelta: 0.0065, longitudeDelta: 0.0065)
        )
    )
    
    
    let tenantData = TenantData.shared
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                
                Image("BG-Upd")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center){
                        VStack(alignment: .leading){
                            Text("Recommended Menu")
                                .bold()
                                .font(.system(size: 28))
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                            Text("Top 4 Menus of this Week 🍽️")
                                .foregroundStyle(.white)
                                .fontWeight(.light)
                        }
                        
                        
                        Spacer()
                        
                        NavigationLink(destination: FavoriteMenuView()) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                                .frame(width: 45, height: 45)
                                .background(.white.opacity(0.5))
                                .clipShape(Circle())
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                                
                        }
                    }
                    
                    
                    
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(tenantData.tenants.flatMap { $0.value }.prefix(4)) { tenant in
                                HStack(alignment: .center, spacing: 10) {
                                    Image(tenant.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 130, height: 130)
                                        .cornerRadius(8)
                                        .shadow(radius: 3)
                                    
                                    VStack(alignment: .leading) {
                                        VStack(alignment: .leading) {
                                            Text(tenant.menuItems.first?.name ?? tenant.name) 
                                                .font(.system(size: 20))
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                            
                                            HStack {
                                                Image(systemName: "mappin.circle.fill")
                                                    .resizable()
                                                    .foregroundColor(.gray)
                                                    .frame(width: 14, height: 14)
                                                
                                                Text(tenant.name)
                                                    .font(.system(size: 12))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.gray)
                                            }
                                            
                                        }
                                        
//                                        Spacer()
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Image(systemName: "tag.fill")
                                                    .resizable()
                                                    .foregroundColor(.green)
                                                    .frame(width: 14, height: 14)
                                                
                                                Text("Rp. \(tenant.menuItems.first?.price ?? String(tenant.price))")
                                                    .font(.caption)
                                                    .foregroundColor(.green)
                                            }
                                        }
                                    }
                                    .frame(width: 140)
                                }
//                                .frame()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 8)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                            .padding(.vertical)
                            .padding(.leading,6)
                        }}
                                        
                    
                    Text("Let's Explore Food in GOP")
                        .bold()
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Map(position: $position) {
                        
                        ForEach(locations) { location in
                            Annotation(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                                NavigationLink(destination: TenantListView(location: location)) {
                                    
                                
                                    
                                    VStack {
                                        Image(systemName: "mappin.circle.fill")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }
                    .frame(height: 400)
                   
                    
                                    
                }
                .navigationBarHidden(true)
                .padding(20)
            }
        }
    }
}

#Preview {
    ContentView()
}
    
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

