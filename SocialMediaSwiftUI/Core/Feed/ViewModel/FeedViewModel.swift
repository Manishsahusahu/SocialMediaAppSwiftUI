//
//  FeedViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 27/04/25.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts() async throws {
        let snapshots = try await Firestore.firestore().collection("posts").order(by: "timestamp", descending: true).getDocuments()
        try await MainActor.run {
            self.posts = try snapshots.documents.compactMap {
                try $0.data(as: Post.self)
            }
        }
    }
}
