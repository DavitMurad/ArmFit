//
//  GymsMap.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import SwiftUI
import MapKit

struct GymsMap: View {
    @EnvironmentObject var mapVM: MapViewModel
    
    var body: some View {
        ZStack {
            Map(position: $mapVM.mapRegion)
            VStack {
                header.padding()
                  
                }
            .frame(maxHeight: .infinity, alignment: .top)
             
            }
        }
    }


#Preview {
    GymsMap().environmentObject(MapViewModel())
}

