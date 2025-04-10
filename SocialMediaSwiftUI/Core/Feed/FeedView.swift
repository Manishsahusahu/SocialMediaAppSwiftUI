//
//  FeedView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0 ..< 20, id: \.self) { _ in
                        FeedCell()
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
