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
    @Published var users: [User] = []
    
    static func fetchAllUsers() async throws ->  [User] {
        let snapshots = try await Firestore.firestore().collection("users").getDocuments()
    
        return snapshots.documents.compactMap { doc in
            try? doc.data(as: User.self)
        }
    }
}
