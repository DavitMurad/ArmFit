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
                
                gymPreviewSection
                .sheet(item: $mapVM.sheetGymLocation, onDismiss: nil) { gym in
                    GymDetailView(gym: gym)
                }
            }
        }
    }
    
}


//#Preview {
//    GymsMap().environmentObject(MapViewModel())
//}

