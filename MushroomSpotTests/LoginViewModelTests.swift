//
//  LoginViewModelTests.swift
//  LoginViewModelTests
//
//  Created by Mijo Gracanin on 09.03.2024..
//

import XCTest
@testable import MushroomSpot

final class LoginViewModelTests: XCTestCase {
    
    var loginViewModel: LoginViewModel!

    override func setUpWithError() throws {
        loginViewModel = LoginViewModel(networkService: MockNetworkService())
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }

    func testEmailValid() {
        loginViewModel.email = "info@mashroom.com"
        
        XCTAssertTrue(loginViewModel.emailError.isEmpty)
    }

    func testEmailInvalid_1() {
        loginViewModel.email = "info@mashroom"
        
        XCTAssertFalse(loginViewModel.emailError.isEmpty)
    }
    
    func testEmailInvalid_2() {
        loginViewModel.email = "info@mashroom.c"
        
        XCTAssertFalse(loginViewModel.emailError.isEmpty)
    }
    
    func testPasswordValid() {
        loginViewModel.password = "12345aA!"
        
        XCTAssertTrue(loginViewModel.passwordError.isEmpty)
    }

    func testPasswordInvalid_1() {
        loginViewModel.password = "1234aA!"
        
        XCTAssertFalse(loginViewModel.passwordError.isEmpty)
    }
    
    func testPasswordInvalid_2() {
        loginViewModel.password = "12345abAB"
        
        XCTAssertFalse(loginViewModel.passwordError.isEmpty)
    }
}
