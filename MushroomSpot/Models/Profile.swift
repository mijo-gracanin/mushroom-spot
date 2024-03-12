//
//  Profile.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 12.03.2024..
//

import Foundation

struct Profile: Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    let id: String
    let username: String
    let firstName: String
    let lastName: String
}
