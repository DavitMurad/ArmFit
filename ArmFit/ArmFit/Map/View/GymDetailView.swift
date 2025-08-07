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

