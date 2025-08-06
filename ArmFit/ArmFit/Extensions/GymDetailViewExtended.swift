//
//  GymDetailViewExtended.swift
//  ArmFit
//
//  Created by Davit Muradyan on 06.08.25.
//

import SwiftUI
import MapKit

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
    
     var backButton: some View {
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
    
     var mapLayer: some View {
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
