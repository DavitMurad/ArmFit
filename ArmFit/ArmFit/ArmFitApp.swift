//
//  ArmFitApp.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import SwiftUI

@main
struct ArmFitApp: App {
    @StateObject var mapVM = MapViewModel()

    var body: some Scene {
        WindowGroup {
            GymsMap()
                .environmentObject(mapVM)
        }
    }
}
