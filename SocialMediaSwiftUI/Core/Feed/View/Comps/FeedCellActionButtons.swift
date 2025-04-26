//
//  FeedCellActionButtons.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedCellActionButtons: View {
    var body: some View {
        HStack(spacing: 20) {
            ActionButtonView(icon: ImageName.heart) {}
            
            ActionButtonView(icon: ImageName.comment) {}
            
            ActionButtonView(icon: ImageName.share) {}
        }
        .padding(.horizontal, 8)
    }
}

private struct ActionButtonView: View {
    let icon: String
    let onClick: () -> Void
    
    var body: some View {
        Button { onClick() } label: {
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundStyle(Color.primary)
        }
    }
}
