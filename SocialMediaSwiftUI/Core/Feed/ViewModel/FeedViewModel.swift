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
        let snapshots = try await Firestore.firestore().collection("posts").order(by: "timestamp", descending: true).getDocuments()
        let decodedPosts = try snapshots.documents.compactMap {
            try $0.data(as: Post.self)
        }
        await MainActor.run {
            self.posts = decodedPosts
        }
        try await populateUsersInPosts()
    }
    
    private func populateUsersInPosts() async throws {
        var usersWithPostId: [String: User] = [:]
        try await withThrowingTaskGroup(of: (Post, User?).self) { group in
            for post in posts {
                let userId = post.ownerUid
                group.addTask {
                    let user = try await UserService.fetchUser(uid: userId)
                    return (post, user)
                }
            }
            
            for try await (post, user) in group {
                usersWithPostId[post.id] = user
            }
        }
        let immutableUsersWithPostId = usersWithPostId
        await MainActor.run {
            for index in self.posts.indices {
                posts[index].user = immutableUsersWithPostId[posts[index].id]
            }
        }
    }
}
