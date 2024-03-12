//
//  LoginViewModel.swift
//  MushroomSpot
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import SwiftUI

@Observable class LoginViewModel {
    private var _email = ""
    var email: String {
        get { _email }
        set {
            _email = newValue
            validateEmail()
        }
    }
    
    private var _password = ""
    var password: String {
        get { _password }
        set {
            _password = newValue
            validatePassword()
        }
    }
    var emailError = ""
    var passwordError = ""
    
    private var isEmailValid = false
    private var isPasswordValid = false
    
    var isLoginEnabled: Bool { isEmailValid && isPasswordValid }
    
    let networkService: NetworkService
    var rootViewModel: RootViewModel?
    var isLoading = false
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func login() {
        Task {
            isLoading = true
            _ = try await networkService.login(email: email, password: password)
            rootViewModel?.isUserLoggedIn = true
            isLoading = false
        }
    }
    
    //  https://stackoverflow.com/a/33524623/1767923
    private func validateEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        isEmailValid = emailPredicate.evaluate(with: email)
        emailError = isEmailValid ? "" : "Invalid email"
    }
    
    // https://stackoverflow.com/a/47473015/1767923
    private func validatePassword() {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        isPasswordValid = passwordPredicate.evaluate(with: password)
        passwordError = isPasswordValid ? "" : """
The passwords needs to contain:
at leas 8 characters,
at least one uppercase letter,
at least one lowercase letter,
at least one digit,
at least one special character (such as @$#!%*?&).
"""
    }
}
