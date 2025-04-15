//
//  Post.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    var imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static let MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Hi, I am Manish Sahu. It is caption of my first post here.",
            likes: 123,
            imageUrl: "",
            timestamp: .init(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Wakanda Forever",
            likes: 193,
            imageUrl: "",
            timestamp: .init(),
            user: User.MOCK_USERS[5]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Iron-Man",
            likes: 133,
            imageUrl: "",
            timestamp: .init(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "Venom is hungry, Time to eat.",
            likes: 93,
            imageUrl: "",
            timestamp: .init(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            caption: "This is my new invention, Guys!",
            likes: 993,
            imageUrl: "",
            timestamp: .init(),
            user: User.MOCK_USERS[3]
        ),
    ]
}
