//
//  ShortCellView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 02/05/25.
//

import SwiftUI
import AVKit

struct ShortCellView: View {
    let url: URL
    
    init(url: URL) {
        self.url = url
        self._player = State(wrappedValue: .init(url: url))
    }
    @State private var player: AVPlayer
    
    var body: some View {
        MyVideoPlayer(player: $player)
            .frame(width: UIScreen.main.bounds.width)
            .containerRelativeFrame(.vertical) { length, _ in
                return length
            }
            .overlay {
                Rectangle()
                    .stroke(Color.pink, lineWidth: 1)
            }
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

struct MyVideoPlayer: UIViewControllerRepresentable {
    @Binding var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        player.play()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
