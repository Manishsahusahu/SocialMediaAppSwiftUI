//
//  ShortCellView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 02/05/25.
//

import SwiftUI
import AVKit

struct ShortCellView: View {
    @Binding var player: AVPlayer?
    
    var body: some View {
        MyVideoPlayer(player: player ?? .init())
            .frame(width: UIScreen.main.bounds.width)
            .containerRelativeFrame(.vertical) { length, _ in
                return length
            }
    }
}

struct MyVideoPlayer: UIViewControllerRepresentable {
    let player: AVPlayer
    
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
