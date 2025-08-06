//
//  GymMapExteneded.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI
import MapKit

extension GymsMap {
    var header: some View {
        VStack {
            Button {
                mapVM.toggleGymList()
            } label: {
                Text(mapVM.gymLocation?.name ?? "Yerevan, Armenia")
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .padding()
                            .rotationEffect(Angle(degrees: mapVM.isExtendingView ? 180 : 0))
                    }
            }
            .foregroundStyle(.primary)
            
            if mapVM.isExtendingView {
                GymListView()
                    .environmentObject(mapVM)
            }
            
        }
        
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.3), radius: 20, y: 15)
        
    }
    
    var mapLayer: some View {
        Map(position: $mapVM.mapRegion) {
            ForEach(mapVM.gyms) { gym in
                Annotation(gym.name, coordinate: CLLocationCoordinate2D(latitude: gym.coordinate.latitude, longitude: gym.coordinate.longitude)) {
                    
                    Image("GymLocation")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .scaleEffect(gym == mapVM.gymLocation ? 1.0 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            mapVM.showNextGymLocation(gymLocation: gym)
                        }
                }
            }
        }
    }
    
    var gymPreviewSection: some View {
        ZStack {
            ForEach(mapVM.gyms) { gym in
                if mapVM.gymLocation == gym {
                    GymPreview(gym: gym)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading)))
                        .environmentObject(mapVM)
                }
                
            }
        }
    }
}
