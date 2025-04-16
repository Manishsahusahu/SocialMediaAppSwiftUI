//
//  UserService.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 16/04/25.
//

import Foundation

class UserService: ObservableObject {
    @Published var users: [User] = []
    
    func fetchAllUsers() {
        users = [
            User(id: "1", username: "Manish", email: "manish@gmail.com"),
            User(id: "2", username: "Amit", email: "amit@gmail.com"),
            User(id: "3", username: "Shubham", email: "shubham@gmail.com"),
        ]
    }
}
