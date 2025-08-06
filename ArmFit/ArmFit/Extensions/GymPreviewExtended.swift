//
//  GymPreviewExtended.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI

extension GymPreview {
    var imageSection: some View {
        ZStack {
            Image(gym.logoName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(5)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    var titleSection: some View {
        VStack(alignment: .leading) {
            Text(gym.name)
                .font(.title3)
                .fontWeight(.bold)
            Text("Rating: \(gym.rating, specifier: "%.1f") out of 5.0")
                .font(.subheadline)
        }
    
        .frame(maxWidth: .infinity, alignment: .leading)
      
    }
    
    var learngMoreButton: some View {
            Button {
                mapVM.sheetGymLocation = gym
            } label: {
                Text("Learn more")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .buttonStyle(.borderedProminent)
            
    }
    var nextButton: some View {
            Button {
                mapVM.nextButtonPressed()
            } label: {
                Text("Next")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .buttonStyle(.bordered)
            
    }
    
}
