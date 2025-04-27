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
    
    init() {
        Task {
            try? await fetchPosts()
        }
    }
    
    func fetchPosts() async throws {
        let posts = try await PostService.fetchPosts()
        await MainActor.run {
            self.posts = posts
        }
    }
}
