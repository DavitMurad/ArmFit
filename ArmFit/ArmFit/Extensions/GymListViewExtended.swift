//
//  GymListViewExtended.swift
//  ArmFit
//
//  Created by Davit Muradyan on 04.08.25.
//

import SwiftUI


extension GymListView {
    func getGymListContent(gym: Gym) -> some View {
        return  HStack {
            Image(gym.logoName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(gym.name)
                    .font(.headline)
                Text(gym.address)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}
