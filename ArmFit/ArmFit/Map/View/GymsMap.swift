//
//  GymsMap.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import SwiftUI
import MapKit

struct GymsMap: View {
    @EnvironmentObject private var mapVM: MapViewModel
   
    var body: some View {
        ZStack {
            Map(position: $mapVM.mapRegion)
        }
    }
}

//#Preview {
//    GymsMap().environmentObject(MapViewModel())
//}
