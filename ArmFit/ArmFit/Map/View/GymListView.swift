//
//  GymListView.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI

struct GymListView: View {
    @EnvironmentObject private var mapVM: MapViewModel
    
    var body: some View {
        List {
            ForEach(mapVM.gyms) { gym in
                Button {
                    mapVM.showNextGymLocation(gymLocation: gym)
                } label : {
                    getGymListContent(gym: gym)
                }
                
         
                
            }
        }
        .listStyle(.plain)
    }
}


