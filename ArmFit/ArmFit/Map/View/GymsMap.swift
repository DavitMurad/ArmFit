//
//  GymsMap.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import SwiftUI


struct GymsMap: View {
    @EnvironmentObject var mapVM: MapViewModel
    
    var body: some View {
        ZStack {
            mapLayer
            
            VStack {
                header.padding()
                    .frame(maxHeight: .infinity, alignment: .top)
                
                Spacer()
                
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
    }
    
}


#Preview {
    GymsMap().environmentObject(MapViewModel())
}

