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
        VStack {
            HStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 42, height: 42)
            }
            
            NameAndBioView()
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
                .padding(.vertical, 8)
        }
        .frame(maxWidth: .infinity)
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 1)
        }
        .padding(16)
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

#Preview {
    ProfileView()
}
