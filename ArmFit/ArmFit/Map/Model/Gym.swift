//
//  Gym.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import Foundation
import CoreLocation

enum GymFacilities: String, CaseIterable, Codable {
    case olympicPool = "Olympic Pool"
    case pools = "Pools"
    case squashCourts = "Squash Courts"
    case spa = "SPA"
    case groupClasses = "Group Classes"
    case modernEquipment = "Modern Equipment"
    case personalTraining = "Personal Training"
    case parking = "Parking"
    case freeWifi = "Free Wifi"
    case kidsClub = "Kids' Club"
    case restaurant = "Restaurant"
    case jacuzzi = "Jacuzzi"
    case danceClasses = "Dance Classes"
    case waterPark = "Water Park"
    case fitnessCenter = "Fitness Center"
    case sauna = "Sauna"
    case cardioEquipment = "Cardio Equipment"
    case pilates = "Pilates"
    case yoga = "Yoga"
    case strengthTraining = "Strength Training"
    case sportsClub = "Sports Club"
    case gym = "Gym"
}

struct Gym: Codable, Identifiable {
    
    var id: String
    let name: String
    let address: String
    let coordinate: Coordinate
    let logoName: String
    let images: [String]
    let facilities: [GymFacility]
    let rating: Double
    let sampleReview: String
}

struct Coordinate: Codable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct GymFacility: Codable, Hashable  {
    let name: GymFacilities
    let icon: String
}

