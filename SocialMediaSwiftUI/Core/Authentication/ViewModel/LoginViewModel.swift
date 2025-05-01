//
//  LoginViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        Task {
            await handleisLoading(true)
            do {
                try await AuthService.shared.login(withEmail: email, password: password)
            } catch {
                print("Login failed with error: \(error.localizedDescription)")
            }
            await handleisLoading(false)
        }
    }
    
    private func handleisLoading(_ isLoading: Bool) async {
        await MainActor.run {
            self.isLoading = isLoading
        }
    }
}
