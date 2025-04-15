//
//  AuthService.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    private init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        await uploadUserData(uid: result.user.uid, name: username, email: email)
    }
    
    func loadUserData() async throws {
        
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, name: String, email: String) async {
        let user = User(id: uid, username: name, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(uid).setData(encodedUser)
    }
}
