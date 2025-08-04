//
//  GymMapExteneded.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI

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
}
