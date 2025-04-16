//
//  SearchViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 16/04/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    let userService: UserService = .init()
    
    
    
    func fetchAllUsers() {
        users = userService.fetchAllUsers()
    }
}
