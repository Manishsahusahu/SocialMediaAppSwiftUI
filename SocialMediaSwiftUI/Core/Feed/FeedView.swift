//
//  FeedView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 20, id: \.self) { _ in
                    FeedCell()
                }
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
    }
}
