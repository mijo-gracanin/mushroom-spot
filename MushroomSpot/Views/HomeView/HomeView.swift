//
//  HomeView.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 10.03.2024..
//

import SwiftUI

struct HomeView: View {
    @State var viewModel: HomeViewModel
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        viewModel = HomeViewModel(networkService: networkService)
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.mushrooms) { mushroom in
                NavigationLink {
                    DetailsView(mushroom: mushroom)
                } label: {
                    MushroomCell(mushroom: mushroom)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.brown)
            .navigationTitle("Mushrooms")
            .toolbar(content: {
                Button(action: {
                    viewModel.isProfileViewPresented = true
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .tint(Color.mushroomGreen)
                })
            })
            .toolbarBackground(.brown, for: .navigationBar)
        }
        
        .sheet(isPresented: $viewModel.isProfileViewPresented, content: {
            ProfileView(networService: networkService)
        })
        .tint(.mushroomGreen)
        .onAppear(perform: {
            Task {
                try await viewModel.loadMushrooms()
            }
        })
    }
}

struct MushroomCell: View {
    let mushroom: Mushroom
    
    var body: some View {
        HStack {
            Text(mushroom.name)
                .font(.title3)
            Spacer()
            Image(uiImage: try! mushroom.picture.getUiImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .offset(x: -16)
        }
    }
}

#Preview {
    HomeView(networkService: MockNetworkService())
}
