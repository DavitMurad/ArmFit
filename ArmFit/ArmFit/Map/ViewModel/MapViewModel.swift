//
//  MapViewModel.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import SwiftUI
import Combine
import MapKit
import _MapKit_SwiftUI


class MapViewModel: ObservableObject {
    @Published var gyms = [Gym]()
    @Published var errorMessage: String?
    @Published var gymLocation: Gym?
    @Published var mapRegion = MapCameraPosition.region(MKCoordinateRegion())
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isExtendingView = false
    
    @Published var sheetGymLocation: Gym? = nil
    init() {
        loadGyms()
    }
    
    private func loadGyms() {
        NetworkService.shared.fethchData()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print(error)
                }
            } receiveValue: {[weak self] gyms in
                self?.gyms = gyms
                self?.setUpFirstGymLoc()
            }
            .store(in: &cancellables)
    }
        
    private func setUpFirstGymLoc() {
        if let last = gyms.last {
            gymLocation = last
            withAnimation(.spring) {
                updateMapRegion(gymLocation: last)
            }
        }
    }
    private func updateMapRegion(gymLocation: Gym) {
        mapRegion = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2DMake(gymLocation.coordinate.latitude, gymLocation.coordinate.longitude), span: mapSpan))
    }
    
    func toggleGymList() {
        withAnimation(.easeInOut) {
            isExtendingView.toggle()
        }
    }
    
    func showNextGymLocation(gymLocation: Gym) {
        withAnimation(.easeInOut) {
            self.gymLocation = gymLocation
            updateMapRegion(gymLocation: gymLocation)
            isExtendingView = false
        }
    }
    
    func nextButtonPressed() {
        guard let currentIndex = gyms.firstIndex(where: {$0 == gymLocation}) else { return }
        let nextIndex = currentIndex + 1
        
        guard gyms.indices.contains(nextIndex) else {
            guard let firstGymLocation = gyms.first else { return }
            showNextGymLocation(gymLocation: firstGymLocation)
            return
        }
        let nextGymLocation = gyms[nextIndex]
        showNextGymLocation(gymLocation: nextGymLocation)
    }
    
    func learnMorePressed() {
        
    }
}
