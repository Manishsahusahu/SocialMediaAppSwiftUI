//
//  SearchView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            HStack {
                                ProfileImageView(size: .small)
                                
                                profileMetaView(
                                    username: user.username,
                                    fullName: user.fullName ?? ""
                                )
                            }
                            .foregroundStyle(Color.primary)
                        }
                    }
                }
                .padding()
                .searchable(text: $searchText, prompt: "Search...")
            }
            .scrollIndicators(.hidden )
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
        }
    }
}

private struct profileMetaView: View {
    let username: String
    let fullName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(username)
                .fontWeight(.semibold)
                
            Text(fullName)
        }
        .font(.footnote)
    }
}

#Preview {
    SearchView()
}
