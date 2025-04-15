//
//  ContentView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @StateObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn {
            MainTabView()
        } else {
            LoginView()
                .environmentObject(registrationViewModel)
        }
    }
}

#Preview {
    ContentView()
}
