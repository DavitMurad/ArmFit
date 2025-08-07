//
//  GymPreview.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI

struct GymPreview: View {
    @EnvironmentObject var mapVM: MapViewModel
    
    let gym: Gym
    var body: some View {
        
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
                
            }
            VStack(spacing: 8) {
                learngMoreButton
                nextButton
            }
          
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
