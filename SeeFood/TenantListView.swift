import SwiftUI
import CoreLocation

struct TenantListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let location: Location
    let tenants = TenantData.shared.tenants
    @StateObject private var locationManager = LocationManager()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    var filteredTenants: [Tenant] {
        tenants.flatMap { $0.value }.filter { $0.locationID == location.id }
    }
    
    func distanceToCurrentLocation() -> String {
        guard let userLocation = locationManager.location else {
            return "..."
        }

        let destination = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        let distanceInMeters = userCLLocation.distance(from: destination)

        if distanceInMeters >= 1000 {
            return String(format: "%.2f km", distanceInMeters / 1000)
        } else {
            return String(format: "%.0f m", distanceInMeters)
        }
    }



    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    Image(location.image)
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    Text(location.name)
                        .bold()
                        .font(.title)
                        .padding(.top, 250)
                    
                    Text("Distance: \(distanceToCurrentLocation())")
                              .font(.subheadline)
                              .foregroundColor(.black)
                              .padding(.horizontal, 12)
                              .padding(.top,305)
                  
                    
                }
                .padding(.bottom, -20)
                
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(filteredTenants) { tenant in
                        NavigationLink(destination: TenantDetailView(location: location, tenant: tenant)) {
                            VStack {
                                Image(tenant.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 160, height: 160)
                                    .clipped()
                                
                                Text(tenant.name)
                                    .bold()
                                    .foregroundColor(.black)
                                    .frame(width: 140)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .padding(.bottom,10)
                          
                            }
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.orange))
                        }
                        .cornerRadius(12)
                        .shadow(radius: 2)
                    }
                }
                .padding()
                .padding(.bottom, 32)
            }
            .ignoresSafeArea(.all)
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
            .onAppear {
                locationManager.requestPermission()
            }
        }
    }
}

#Preview {
    let sampleLocation = LocationData.shared.locations.first!
    return TenantListView(location: sampleLocation)
}
