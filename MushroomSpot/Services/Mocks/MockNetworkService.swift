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
    
    func getMushrooms() async throws -> [Mushroom] {
        guard let path = Bundle.main.path(forResource: "mushrooms", ofType: "json") else {
            fatalError("Cannot find mushrooms.json")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        let dict = try JSONDecoder().decode(Dictionary<String, Array<Mushroom>>.self, from: data)
        guard let mushrooms = dict["mushrooms"] else { throw MushroomSpotError.unexpectedNil }
        return mushrooms
    }
    
    func getProfile() async throws -> Profile {
        guard let path = Bundle.main.path(forResource: "profile", ofType: "json") else {
            fatalError("Cannot find profile.json")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        let dict = try JSONDecoder().decode(Dictionary<String, Profile>.self, from: data)
        guard let profile = dict["user"] else { throw MushroomSpotError.unexpectedNil }
        return profile
    }
}
