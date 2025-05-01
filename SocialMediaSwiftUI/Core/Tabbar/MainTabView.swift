//
//  MainTabView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 09/04/25.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    @State private var selectedTab: TabType = .feed
    @State private var shouldReloadFeed: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("", systemImage: "house", value: .feed) {
                FeedView(shouldReloadFeed: shouldReloadFeed)
                    .toolbarBackground(.thinMaterial, for: .tabBar)
            }
            
            Tab("", systemImage: "magnifyingglass", value: .search) {
                SearchView()
                    .toolbarBackground(.thinMaterial, for: .tabBar)
            }
            
            Tab("", systemImage: "plus.square", value: .createPost) {
                UploadPostView {
                    selectedTab = .feed
                } reload: {
                    shouldReloadFeed = true
                }
                .toolbarBackground(.thinMaterial, for: .tabBar)
            }
            
            Tab("", systemImage: "heart", value: .notifications) {
                Text("Notifications")
                    .toolbarBackground(.thinMaterial, for: .tabBar)
            }
            
            Tab("", systemImage: "person", value: .profile) {
                CurrentUserProfileView(user: user)
                    .toolbarBackground(.thinMaterial, for: .tabBar)
            }
        }
        .toolbarBackground(.thinMaterial, for: .tabBar)
        .tint(.primary)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
