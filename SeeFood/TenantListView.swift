
import SwiftUI

struct TenantListView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let location: Location
    let tenants = TenantData.shared.tenants
    let appearance = UINavigationBarAppearance()
    
    var filteredTenants: [Tenant] {
        tenants.flatMap { $0.value }.filter { $0.locationID == location.id }
    }

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        
       ]
       
    var body: some View {
        
    NavigationStack{

            ScrollView{
                
                ZStack{
                    
                    Image(location.image)
                        .resizable()
                        .ignoresSafeArea(.all)
                    
                    //button back
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
                            .padding(.bottom, 200)
                            .padding(.trailing,290)
                    }
            
                    // nama location
                    Text(location.name)
                        .bold()
                        .font(.title)
                        .padding(.top, 200)
                    
                }
               
                LazyVGrid(columns: columns, spacing: 16) {
                    
                    ForEach(filteredTenants) { tenant in
                        NavigationLink(destination: TenantDetailView(location: location, tenant: tenant)) {
                            VStack {
                                
                                Image(tenant.image)
                                    .resizable()
                                    .frame(width: 140, height: 130 )
                                
                                Text(tenant.name)
                                    .bold()
                                    .foregroundColor(.black)
                                    
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.2)))
                        }
                    }
                }
                .padding()
            }
            .frame(height: 905)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    let sampleLocation = LocationData.shared.locations.first!
    return TenantListView(location: sampleLocation)
}
