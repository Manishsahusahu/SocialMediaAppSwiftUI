//
//  FeedCell.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = post.user {
                CellHeader(username: user.username)
            }
            
            CellMediaView()
            
            FeedCellActionButtons()
            
            CellFooterView(
                likes: post.likes,
                caption: post.caption,
                fullname: post.user?.fullName ?? ""
            )
        }
    }
}

private struct CellHeader: View {
    let username: String
    
    var body: some View {
        HStack {
            ProfileImageView(size: .small)
            
            Text(username)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 8)
    }
}

private struct CellMediaView: View {
    var body: some View {
        Rectangle()
            .fill(Color.primary.opacity(0.3))
            .frame(maxWidth: .infinity)
            .frame(height: 300)
    }
}
