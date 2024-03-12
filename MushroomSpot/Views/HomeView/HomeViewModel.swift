//
//  HomeViewModel.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 10.03.2024..
//

import Foundation

@Observable class HomeViewModel {
    var mushrooms: [Mushroom] = []
    var isLoading = true
    var isProfileViewPresented = false
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadMushrooms() async throws {
        isLoading = true
        mushrooms = try await networkService.getMushrooms()
        isLoading = false
    }
}
