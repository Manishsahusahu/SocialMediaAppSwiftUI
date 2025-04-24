//
//  ProfileHeaderView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    @State private var showEditProfileView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileImageView(size: .large)
                
                Spacer().frame(width: 30)
                
                StatsView()
            }
            
            NameAndBioView(fullName: user.fullName, bio: user.bio)
            
            EditProfileButton(isCurrentUser: user.isCurrentUser) {
                showEditProfileView.toggle()
            }
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showEditProfileView) {
            Text("Edit Profile")
                .onTapGesture {
                    showEditProfileView.toggle()
                }
        }
    }
}

private struct EditProfileButton: View {
    let isCurrentUser: Bool
    let onClick: () -> Void
    
    var body: some View {
        Button { onClick() } label: {
            ZStack {
                Text(isCurrentUser ? Strings.editProfile : Strings.follow)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(isCurrentUser ? Color.primary : Color(.systemBackground))
                    .padding(.vertical, 8)
            }
            .frame(maxWidth: .infinity)
            .background(isCurrentUser ? Color.clear : Color(.systemBlue))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .overlay {
                if isCurrentUser {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.gray, lineWidth: 1)
                }
            }
            .padding(.vertical)
        }
    }
}

private struct NameAndBioView: View {
    let fullName: String?
    let bio: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let fullName {
                Text(fullName)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            
            if let bio {
                Text(bio)
                    .font(.footnote)
            }
        }
    }
}

private struct StatsView: View {
    var body: some View {
        HStack(spacing: 0) {
            StatView(label: "30", value: "Posts")
            
            Spacer()
            
            StatView(label: "1.1M", value: "Followers")
            
            Spacer()
            
            StatView(label: "2", value: "Following")
        }
    }
}

private struct StatView: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(value)
                .font(.footnote)
        }
    }
}
