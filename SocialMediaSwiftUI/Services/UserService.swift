//
//  UserService.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 16/04/25.
//

import Foundation
import FirebaseFirestore
import Firebase

class UserService: ObservableObject {
    static func fetchAllUsers() async throws ->  [User] {
        let snapshots = try await Firestore.firestore().collection("users").getDocuments()
    
        return snapshots.documents.compactMap { doc in
            try? doc.data(as: User.self)
        }
    }
    
    static func fetchUser(uid: String) async throws -> User? {
        let snapshot = Firestore.firestore().collection("users").document(uid)
        
        return try await snapshot.getDocument().data(as: User.self)
    }
}
