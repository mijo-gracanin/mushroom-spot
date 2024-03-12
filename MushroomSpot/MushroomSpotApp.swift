//
//  MushroomSpotApp.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import SwiftUI

@main
struct MushroomSpotApp: App {
    var body: some Scene {
        WindowGroup {
            if isProduction {
                RootView()
            }
        }
    }
    
    private var isProduction: Bool {
            NSClassFromString("XCTestCase") == nil
        }
}
