//
//  User.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
}
