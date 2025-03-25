//
//  ContentView.swift
//  SeeFood
//
//  Created by Lysandra Velyca on 14/03/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -6.301763, longitude: 106.652762),
            span: MKCoordinateSpan(latitudeDelta: 0.0065, longitudeDelta: 0.0065)
        )
    )
  
    let locations = LocationData.shared.locations
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                Image("tes")
                    .resizable()
                    .ignoresSafeArea(.all)

                VStack(alignment: .leading) {
                    
                    HStack{
                       
                        Text("Welcome to SeeFood,")
                            .bold()
                            .font(.system(size: 18))
                            .padding(.bottom, -10)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        NavigationLink(destination: FavoriteMenuView()) {
                            Image(systemName: "star.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.orange)
                                .frame(width: 45, height: 45)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.trailing, 10)
                                .padding(.bottom, 5)
                        }
                    }
                    
                    Text("This Week's Recommendation")
                        .bold()
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
//                        .padding(.top, -12)
                    Text("Try out these delicious menus🍽️")
                        .foregroundStyle(.white)
                       
                    
                    ScrollView(.horizontal){
                        
                        HStack(spacing: 12){
                            
                            Image("pohon")
                                .resizable()
                                .frame(width: 230, height: 150)
    //                            .border(.green)
                            
                            Image("kantin")
                                .resizable()
                            //                               .aspectRatio(contentMode: .fill)
                                .frame(width: 230, height: 150)
    //                            .border(.green)
                            
                            Image("logo")
                                .resizable()
                            //                               .aspectRatio(contentMode: .fill)
                                .frame(width: 230, height: 150)
    //                            .border(.green)
                            
                            
                            
                        }
                        .padding(.bottom, 12)
                        
                    }
                    
                    Text("Let's Explore Food in GOP")
//                        .font(.title)
                        .bold()
                        .font(.system(size: 26))
                    
                    
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
                   
                    
                    Spacer()
                            .padding(.top, 10)
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

