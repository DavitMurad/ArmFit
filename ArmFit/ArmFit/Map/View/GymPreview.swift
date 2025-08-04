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



//#Preview {
//    ZStack {
//        Color.green.ignoresSafeArea()
//        GymPreview(gym: Gym(id: "e445df9e-990a-4286-8f3e-8120e3c04c05", name: "Reebok Sports Club", address: "5 Pirumyanner street, 0009, Yerevan, Armenia", coordinate: Coordinate(latitude: 40.220713745405554, longitude: 44.49461894211808), logoName: "Reebok", images: ["ReebokImg", "ReebokImg", "ReebokImg"], facilities: [GymFacility(name: GymFacilities(rawValue: "Olympic Pool") ?? .cardioEquipment, icon: "pool.png"), GymFacility(name: GymFacilities(rawValue: "Squash Courts") ?? .freeWifi, icon: "squash-racquet.png"), GymFacility(name: GymFacilities(rawValue: "SPA") ?? .danceClasses, icon: "spa.png"), GymFacility(name: GymFacilities(rawValue: "Group Classes") ?? .danceClasses, icon: "group.png")], rating: 4.8, sampleReview: "A high-end club with a great pool and excellent, modern equipment. The club offers a variety of specialized training options and is known for its professional atmosphere."))
//    }
//  
//}
