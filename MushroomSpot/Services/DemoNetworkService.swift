//
//  DemoNetworkService.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import Foundation

struct DemoNetworkService: NetworkService {
    func login(email: String, password: String) async throws -> String {
        guard let url = URL(string: "https://demo5845085.mockable.io/api/v1/users/login") else {
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let credentials = ["email": email, "password": password]
        let credentialsData = try JSONEncoder().encode(credentials)
        request.httpBody = credentialsData
        
        let result = try await URLSession.shared.data(for: request)
        guard let httpResponse = result.1 as? HTTPURLResponse, (200..<299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCodeNotSuccess
        }
        
        guard
            let json = try JSONSerialization.jsonObject(with: result.0, options: .mutableContainers) as? [String: String],
            let token = json["auth_token"]
        else { throw MushroomSpotError.unexpectedNil }
        return token
    }
    
    func getMushrooms() async throws -> [Mushroom] {
        guard let url = URL(string: "https://demo5845085.mockable.io/api/v1/mushrooms") else {
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        
        let result = try await URLSession.shared.data(for: request)
        guard let httpResponse = result.1 as? HTTPURLResponse, (200..<299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCodeNotSuccess
        }
        
        let dict = try JSONDecoder().decode(Dictionary<String, Array<Mushroom>>.self, from: result.0)
        guard let mushrooms = dict["mushrooms"] else { throw MushroomSpotError.unexpectedNil }
        return mushrooms
    }
    
    func getProfile() async throws -> Profile {
        guard let url = URL(string: "https://demo5845085.mockable.io/users/me") else {
            throw NetworkError.invalidUrl
        }
        var request = URLRequest(url: url)
        
        let result = try await URLSession.shared.data(for: request)
        guard let httpResponse = result.1 as? HTTPURLResponse, (200..<299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCodeNotSuccess
        }
        
        let dict = try JSONDecoder().decode(Dictionary<String, Profile>.self, from: result.0)
        guard let profile = dict["user"] else { throw MushroomSpotError.unexpectedNil }
        return profile
    }
}
