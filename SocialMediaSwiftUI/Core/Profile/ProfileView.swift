//
//  ProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView()
                
                EditProfileButton()
            }
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        HStack {
            VStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 42, height: 42)
                
                Text("Don Manish")
            }
        }
    }
}

private struct EditProfileButton: View {
    var body: some View {
        ZStack {
            Text("Edit Profile")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(Color.primary)
        }
    }
}

#Preview {
    ProfileView()
}
