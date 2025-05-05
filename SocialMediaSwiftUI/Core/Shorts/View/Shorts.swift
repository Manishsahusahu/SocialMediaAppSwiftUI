//
//  Shorts.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 02/05/25.
//

import SwiftUI
import AVKit

struct Shorts: View {
    @StateObject private var viewModel = ShortsViewModel()
    
    @State private var scrollItemId: Int? = 0
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.videos.indices, id: \.self) { index in
                    let video = viewModel.videos[index]
                    if let source = video.sources.first, let url = URL(string: source) {
                        ShortCellView(player: $player)
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollItemId)
        .ignoresSafeArea()
        .task(id: scrollItemId) {
            player?.pause()
            player = nil
            if let scrollItemId,
                let source = viewModel.videos[scrollItemId].sources.first,
                let url = URL(string: source) {
                player = .init(url: url)
                player?.play()
            }
        }
    }
}
