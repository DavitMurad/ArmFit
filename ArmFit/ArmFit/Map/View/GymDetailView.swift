//
//  GymDetailView.swift
//  ArmFit
//
//  Created by Davit Muradyan on 05.08.25.
//

import SwiftUI
import MapKit

struct GymDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var mapVM: MapViewModel
    let gym: Gym
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        GeometryReader { geom in
            ScrollView {
                VStack {
                    getTabViewSection(geom.size.width)
                        .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        titleSection
                        ratingSection
                        
                        Divider()
                        LazyVGrid(columns: columns) {
                            ForEach(gym.facilities, id: \.self) { fac in
                                getCustomLabel(imageName: fac.icon, facName: fac.name.rawValue)
                            }
                            
                        }
                        Divider()
                        HStack(spacing: 15) {
                            contactsSection(linkAddress: gym.contacts.facebook, iconName: "fb", size: 38)
                            contactsSection(linkAddress: gym.contacts.instagram, iconName: "insta")
                            contactsSection(linkAddress: "tel:" + gym.contacts.phone, iconName: "phone", size: 33)
                            
                        }
                        mapLayer
                        
                        Text("Customer Review:")
                        reviewSection
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .ignoresSafeArea()
            .background(.ultraThinMaterial)
            .overlay(alignment: .topLeading) {
                backButton
            }
        }
    }
}



//
//#Preview {
//    GymDetailView(gym: Gym(
//        id: "e445df9e-990a-4286-8f3e-8120e3c04c05",
//        name: "Reebok Sports Club",
//        address: "5 Pirumyanner street, 0009, Yerevan, Armenia",
//        coordinate: Coordinate(latitude: 40.220713745405554, longitude: 44.49461894211808),
//        logoName: "Reebok",
//        images: ["ReebokImg", "NeoImg", "OrangeImg"],
//        facilities: [
//            GymFacility(name: GymFacilities(rawValue: "Olympic Pool") ?? .olympicPool, icon: "pool.png"),
//            GymFacility(name: GymFacilities(rawValue: "Squash Courts") ?? .squashCourts, icon: "squash-racquet.png"),
//            GymFacility(name: GymFacilities(rawValue: "SPA") ?? .spa, icon: "spa.png"),
//            GymFacility(name: GymFacilities(rawValue: "Group Classes") ?? .groupClasses, icon: "group.png")
//        ],
//        rating: 4.8,
//        sampleReview: "A high-end club with a great pool and excellent, modern equipment. The club offers a variety of specialized training options and is known for its professional atmosphere.",
//        contacts: GymContacts(
//            instagram: "https://www.instagram.com/reeboksportsclubarmenia/",
//            facebook: "https://www.facebook.com/reeboksportsclub",
//            phone: "+374 10 363636"
//        )
//    ))
//}
