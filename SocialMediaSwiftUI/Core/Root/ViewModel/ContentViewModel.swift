//
//  ContentViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    let authService = AuthService.shared
    
    init() {
        setupPublisher()
    }
    
    var isLoggedIn: Bool {
        userSession != nil
    }
    
    private func setupPublisher() {
        authService.$userSession
            .receive(on: DispatchQueue.main)
            .sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
