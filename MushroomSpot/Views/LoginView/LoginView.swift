//
//  LoginView.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import SwiftUI

struct LoginView: View {
    
    @State var viewModel = LoginViewModel(networkService: DemoNetworkService())
    @Environment(RootViewModel.self) private var rootViewModel: RootViewModel?
    
    init(networService: NetworkService) {
        viewModel = LoginViewModel(networkService: networService)
    }
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
            
            Spacer()

            VStack(spacing: 16) {
                TextField(text: $viewModel.email) {
                    Text("Email")
                }
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                
                SecureField(text: $viewModel.password) {
                    Text("Password")
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding()
            
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.emailError)
                Text(viewModel.passwordError)
            }
            .foregroundStyle(Color.orange)
            .font(.footnote)
            
            Spacer()
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                Button("Login") {
                    viewModel.login()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color.mushroomGreen)
                .disabled(!viewModel.isLoginEnabled)
            }
            
        }
        .animation(.easeIn, value: viewModel.isLoginEnabled)
        .animation(.easeIn, value: viewModel.isLoading)
        .background(Color.brown)
        .onAppear(perform: {
            viewModel.rootViewModel = rootViewModel
        })
    }
}

#Preview {
    LoginView(networService: MockNetworkService())
}
