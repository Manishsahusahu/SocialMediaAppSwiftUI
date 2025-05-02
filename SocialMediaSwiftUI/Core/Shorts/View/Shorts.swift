//
//  Shorts.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 02/05/25.
//

import SwiftUI

struct Shorts: View {
    @StateObject private var viewModel = ShortsViewModel()
    
    @State private var scrollItemId: String?
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.videos) { video in
                    if let source = video.sources.first, let url = URL(string: source) {
                        ShortCellView(url: url)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned(limitBehavior: .alwaysByOne))
        .scrollPosition(id: $scrollItemId)
    }
}
