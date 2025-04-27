//
//  ProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                ProfileGridView(user: user)
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarContent
        }
    }
    
    private var toolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {} label: {
                Image(systemName: "line.3.horizontal")
                    .renderingMode(.template)
                    .foregroundStyle(Color.primary)
            }
        }
    }
}


#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
