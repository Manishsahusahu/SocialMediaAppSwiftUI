//
//  MainTabView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 09/04/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabType = .feed
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("", systemImage: "house", value: .feed) {
                FeedView(posts: Post.MOCK_POSTS)
            }
            
            Tab("", systemImage: "magnifyingglass", value: .search) {
                SearchView()
            }
            
            Tab("", systemImage: "plus.square", value: .createPost) {
                UploadPostView()
            }
            
            Tab("", systemImage: "heart", value: .notifications) {
                Text("Notifications")
            }
            
            Tab("", systemImage: "person", value: .profile) {
                CurrentUserProfileView(user: User.MOCK_USERS[0])
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
