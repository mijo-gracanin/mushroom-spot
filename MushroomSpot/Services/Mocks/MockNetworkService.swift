//
//  MockNetworkService.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 10.03.2024..
//

import Foundation

struct MockNetworkService: NetworkService {
    func login(email: String, password: String) async throws -> String {
        return "mock"
    }
}
