//
//  AuthService.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation
import FirebaseAuth

class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        
    }
}
