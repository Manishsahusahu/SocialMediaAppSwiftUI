//
//  User.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
}

extension User {
    static let MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            username: "manishsahu123",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Manish Sahu",
            bio: "Hello, I am Manish Sahu",
            email: "manishsahu@example.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "batman",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Bruce Wayne",
            bio: "Gotham's Dark knight",
            email: "batman@example.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "venom",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Eddie Brock",
            bio: "Venom",
            email: "venom@example.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "ironman",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Tony Stark",
            bio: "Billionaire",
            email: "ironman@example.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "spiderman",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Peter Parker",
            bio: "Hanging creature",
            email: "spiderman@example.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "black-panther",
            profileImageUrl: "https://example.com/profile.jpg",
            fullName: "Black Panther",
            bio: "Wakanda",
            email: "black_panther@example.com"
        ),
    ]
}
