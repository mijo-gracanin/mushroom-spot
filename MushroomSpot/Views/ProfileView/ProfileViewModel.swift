//
//  ProfileViewModel.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 12.03.2024..
//

import Foundation

@Observable class ProfileViewModel {
    var profile: Profile?
    
    var isLoading: Bool { profile == nil }
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadProfile() async throws {
        profile = try await networkService.getProfile()
    }
}
