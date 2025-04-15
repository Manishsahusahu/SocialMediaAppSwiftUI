//
//  ProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeaderView()
                
                ProfileGridView()
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Profile")
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
    ProfileView()
}
