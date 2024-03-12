//
//  ProfileView.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 12.03.2024..
//

import SwiftUI

struct ProfileView: View {
    
    var viewModel: ProfileViewModel
    
    init(networService: NetworkService) {
        viewModel = ProfileViewModel(networkService: networService)
    }
    
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                Text("Profile")
                    .font(.title)
                Spacer()
                if let profile = viewModel.profile {
                    
                    List {
                        HStack {
                            Text("Username")
                            Spacer()
                            Text(profile.username)
                                .foregroundStyle(Color.mushroomGreen)
                        }
                        HStack {
                            Text("First name")
                            Spacer()
                            Text(profile.firstName)
                                .foregroundStyle(Color.mushroomGreen)
                        }
                        HStack {
                            Text("Last name")
                            Spacer()
                            Text(profile.lastName)
                                .foregroundStyle(Color.mushroomGreen)
                        }
                    }
                    .frame(height:300)
                    .scrollContentBackground(.hidden)
                    .presentationCompactAdaptation(horizontal: .sheet, vertical: .sheet)
                    
                    Spacer()
                } else {
                    ProgressView()
                    Spacer()
                }
            }
            .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: viewModel.isLoading)
        }
        .navigationTitle("Profile")
        .onAppear(perform: {
            Task {
                try await viewModel.loadProfile()
            }
        })
    }
}

#Preview {
    ProfileView(networService: MockNetworkService())
}
