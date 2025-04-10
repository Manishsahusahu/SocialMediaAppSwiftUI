//
//  FeedCell.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            CellHeader()
            
            CellMediaView()
            
            FeedCellActionButtons()
        }
    }
}

private struct CellHeader: View {
    var body: some View {
        HStack {
            ProfileImageView(size: .small)
            
            Text("Don Manish")
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
    }
}

private struct CellMediaView: View {
    var body: some View {
        Rectangle()
            .fill(Color.primary.opacity(0.3))
            .frame(width: .infinity, height: 300)
    }
}
