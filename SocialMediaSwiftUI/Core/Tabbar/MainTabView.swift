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
                FeedView()
            }
            
            Tab("", systemImage: "magnifyingglass", value: .feed) {
                SearchView()
            }
            
            Tab("", systemImage: "plus.square", value: .feed) {
                FeedView()
            }
            
            Tab("", systemImage: "heart", value: .feed) {
                FeedView()
            }
            
            Tab("", systemImage: "person", value: .feed) {
                CurrentUserProfileView()
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
