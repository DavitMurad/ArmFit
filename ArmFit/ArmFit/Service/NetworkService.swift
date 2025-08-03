//
//  NetworkService.swift
//  ArmFit
//
//  Created by Davit Muradyan on 03.08.25.
//

import Foundation
import Combine

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func fethchData() -> AnyPublisher<[Gym], Error> {
        if let url = Bundle.main.url(forResource: "GymData", withExtension: "json") {
            return URLSession.shared.dataTaskPublisher(for: url)
                .subscribe(on: DispatchQueue.global())
                .receive(on: DispatchQueue.main)
                .map({$0.data})
                .decode(type: [Gym].self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        }
        
        return Just([])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
        
    }
}
