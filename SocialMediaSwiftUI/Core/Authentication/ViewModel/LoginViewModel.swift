//
//  LoginViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        Task {
            do {
                try await AuthService.shared.login(withEmail: email, password: password)
            } catch {
                print("Login failed with error: \(error.localizedDescription)")
            }
        }
    }
}
