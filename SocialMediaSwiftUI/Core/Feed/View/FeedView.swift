//
//  FeedView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedView: View {
    let shouldReloadFeed: Bool
    
    @StateObject private var viewModel: FeedViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.vertical)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                leadingToolbarContent
            }
            .refreshable {
                try? await viewModel.fetchPosts()
            }
            .onChange(of: shouldReloadFeed) { _, value in
                if value {
                    Task {
                        try? await viewModel.fetchPosts()
                    }
                }
            }
        }
    }
    
    private var leadingToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text(Strings.manishSahuApp)
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}
