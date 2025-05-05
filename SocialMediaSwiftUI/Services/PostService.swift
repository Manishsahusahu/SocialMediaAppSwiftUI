//
//  PostService.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 27/04/25.
//

import Foundation
import FirebaseFirestore

class PostService {
    static func fetchPosts() async throws -> [Post] {
        let snapshots = try await Firestore.firestore().collection("posts").order(by: "timestamp", descending: true).getDocuments()
        var posts = try snapshots.documents.compactMap {
            try $0.data(as: Post.self)
        }
        posts = try await populateUsersInPosts(posts: posts)
        return posts
    }
    
    private static func populateUsersInPosts(posts: [Post]) async throws -> [Post] {
        var updatedPosts: [Post] = []
        try await withThrowingTaskGroup(of: (Post, User?).self) { group in
            for post in posts {
                let userId = post.ownerUid
                group.addTask {
                    let user = try await UserService.fetchUser(uid: userId)
                    return (post, user)
                }
            }
            
            for try await (post, user) in group {
                var newPost = post
                newPost.user = user
                updatedPosts.append(newPost)
            }
        }
        return updatedPosts
    }
    
    static func fetchUserPosts(user: User) async throws -> [Post] {
        let snapshots = try await Firestore.firestore().collection("posts").whereField("ownerUid", isEqualTo: user.id).getDocuments()
        let posts = try snapshots.documents.compactMap {
            var post = try $0.data(as: Post.self)
            post.user = user
            return post
        }
        return posts
    }
}
