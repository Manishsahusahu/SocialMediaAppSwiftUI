//
//  ProfileGridViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 27/04/25.
//

import Foundation

class ProfileGridViewModel: ObservableObject {
    let user: User
    @Published var posts: [Post] = []
    
    init(user: User) {
        self.user = user
        fetchPosts()
    }
    
    func fetchPosts() {
        Task {
            do {
                let fetchedPosts = try await PostService.fetchUserPosts(user: user)
                await MainActor.run {
                    self.posts = fetchedPosts
                }
            } catch {
                print("Failed to fetch posts: \(error.localizedDescription)")
            }
        }
    }
}
