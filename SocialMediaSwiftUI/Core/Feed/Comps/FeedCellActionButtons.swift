//
//  FeedCellActionButtons.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedCellActionButtons: View {
    var body: some View {
        HStack {
            ActionButtonView(icon: "heart") {}
            
            ActionButtonView(icon: "bubble.right") {}
            
            ActionButtonView(icon: "paperplane") {}
        }
    }
}

private struct ActionButtonView: View {
    let icon: String
    let onClick: () -> Void
    
    var body: some View {
        Button { onClick() } label: {
            Image(systemName: icon)
        }
    }
}
