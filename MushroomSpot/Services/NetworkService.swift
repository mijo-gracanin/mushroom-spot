//
//  NetworkService.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import Foundation

protocol NetworkService {
    func login(email: String, password: String) async throws -> String
    func getMushrooms() async throws -> [Mushroom]
    func getProfile() async throws -> Profile
}
