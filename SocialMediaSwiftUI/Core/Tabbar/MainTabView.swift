//
//  MainTabView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 09/04/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab {
                Text("Home")
            } label: {
                Image(systemName: "house")
            }
            
            Tab {
                Text("Search")
            } label: {
                Image(systemName: "magnifyingglass")
            }
            
            Tab {
                Text("Post Upload")
            } label: {
                Image(systemName: "plus.square")
            }
            
            Tab {
                Text("Notifications")
            } label: {
                Image(systemName: "heart")
            }
            
            Tab {
                ProfileView()
            } label: {
                Image(systemName: "person")
            }
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
}
