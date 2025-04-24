//
//  SearchViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 16/04/25.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task {
            try? await fetchAllUsers()
        }
    }
    
    func fetchAllUsers() async throws {
        let users = try await UserService.fetchAllUsers()
        
        await MainActor.run {
            self.users = users
        }
    }
}
