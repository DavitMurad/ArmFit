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
    @EnvironmentObject private var mapVM: MapViewModel
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
                        HStack {
                            contactsSection(linkAddress: gym.contacts.facebook, iconName: "fb", size: 34)
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

extension GymDetailView {
    func getTabViewSection(_ width: Double) -> some View {
        TabView {
            ForEach(gym.images, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
    
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(gym.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(gym.address)
                .font(.callout)
        }
    }
    
    func contactsSection(linkAddress: String, iconName: String, size: CGFloat = 35) -> some View {
        if let url = URL(string: linkAddress) {
            return AnyView(
                Link(destination: url) {
                    Image(iconName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: size, height: size)
                }
            )
        }
        return AnyView(
            Link(destination: URL(string: "https://example.com")!) {
                Text("Invalid URL")
            }
        )
    }
    
    private var backButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(15)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        }
    }
    
    var ratingSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                ForEach(0..<5) { i in
                    Image(systemName: i < Int(gym.rating.rounded()) ? "star.fill" : "star")
                }
            }
            Text(String(format: "%.1f", gym.rating))
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        
    }
    var reviewSection: some View {
        Text("“\(gym.sampleReview)”")
            .font(.body)
            .foregroundColor(.gray)
            .italic()
            .padding(.bottom)
    }
    
    private var mapLayer: some View {
        Map(position: .constant(.region(MKCoordinateRegion(
            center: CLLocationCoordinate2DMake(gym.coordinate.latitude, gym.coordinate.longitude) ,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )))) {
            Annotation(gym.name, coordinate: CLLocationCoordinate2DMake(gym.coordinate.latitude, gym.coordinate.longitude)) {
                Image("GymLocation")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .scaleEffect(gym == mapVM.gymLocation ? 1.0 : 0.7)
                    .shadow(radius: 10)
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(30)
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
