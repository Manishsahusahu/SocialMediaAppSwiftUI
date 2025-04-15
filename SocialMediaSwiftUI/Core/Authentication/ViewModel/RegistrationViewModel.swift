//
//  RegistrationViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func createUser() async {
        do {
            try await AuthService.shared.createUser(
                email: email,
                password: password,
                username: username
            )
        } catch {
            print("Registration failed: \(error.localizedDescription)")
        }
    }
}
