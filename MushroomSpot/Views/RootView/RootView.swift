//
//  RootView.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 10.03.2024..
//

import SwiftUI

struct RootView: View {
    private let networkService: NetworkService
    @State private var rootViewModel: RootViewModel
    
    init(networkService: NetworkService = DemoNetworkService(), rootViewModel: RootViewModel = RootViewModel()) {
        self.networkService = networkService
        self.rootViewModel = rootViewModel
    }
    
    var body: some View {
        if rootViewModel.isUserLoggedIn {
            HomeView(networkService: networkService)
        } else {
            LoginView(networService: networkService)
                .environment(rootViewModel)
        }
    }
}

#Preview {
    RootView(networkService: MockNetworkService())
}
