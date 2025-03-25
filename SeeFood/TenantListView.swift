//
//  TenantListView.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 19/03/25.
//

import SwiftUI

struct TenantListView: View {
    
    let location: Location
    let tenants = TenantData.shared.tenants

    var filteredTenants: [Tenant] {
        tenants.filter { $0.locationID == location.id }
    }

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
           
       ]
       
       var body: some View {
           
           
           ScrollView {
               LazyVGrid(columns: columns, spacing: 16) {
                   ForEach(filteredTenants) { tenant in
                       NavigationLink(destination: TenantDetailView(tenant: tenant)) {
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
           .navigationTitle(location.name)
    }
}
#Preview {
    let sampleLocation = LocationData.shared.locations.first!
    return TenantListView(location: sampleLocation)
}
