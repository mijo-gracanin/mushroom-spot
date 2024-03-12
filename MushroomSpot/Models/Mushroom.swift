//
//  Mushroom.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 10.03.2024..
//

import Foundation

struct Mushroom: Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case latinName = "latin_name"
        case picture = "profile_picture"
    }
    
    let id: String
    let name: String
    let latinName: String
    let picture: String
}
