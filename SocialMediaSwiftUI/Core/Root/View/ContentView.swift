//
//  ContentView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 08/04/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        if let user = AuthService.shared.currentUser {
            MainTabView(user: user)
        } else {
            LoginView()
                .environmentObject(registrationViewModel)
        }
    }
}

#Preview {
    ContentView()
}
