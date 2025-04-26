//
//  FeedView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedView: View {
    let posts: [Post]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(posts) { post in
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
                trailingToolbarContent
            }
        }
    }
    
    private var leadingToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("DonManish")
                .font(.headline)
                .fontWeight(.bold)
        }
    }
    
    private var trailingToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: ImageName.share)
        }
    }
}
