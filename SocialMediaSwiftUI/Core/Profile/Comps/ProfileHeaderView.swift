//
//  ProfileHeaderView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ProfileImageView(size: .large)
                
                Spacer().frame(width: 30)
                
                StatsView()
            }
            
            NameAndBioView()
            
            EditProfileButton()
        }
        .padding(.horizontal)
    }
}

private struct EditProfileButton: View {
    var body: some View {
        ZStack {
            Text("Edit Profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
                .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 1)
        }
        .padding(.vertical)
    }
}

private struct NameAndBioView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Don Manish")
                .font(.footnote)
                .fontWeight(.semibold)
            
            Text("Software Engineer")
                .font(.footnote)
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
