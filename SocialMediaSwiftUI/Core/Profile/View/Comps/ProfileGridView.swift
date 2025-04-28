//
//  ProfileGridView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI
import Kingfisher

struct ProfileGridView: View {
    let user: User
    
    @StateObject private var viewModel: ProfileGridViewModel
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: .init(user: user))
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    @Namespace private var ProfileNamespace
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(viewModel.posts) { post in
                let url = post.imageUrl
                
                NavigationLink(value: url) {
                    KFImage(URL(string: url))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width / 3 - 2, height: 140)
                        .matchedTransitionSource(id: url, in: ProfileNamespace)
                }
            }
        }
        .navigationDestination(for: String.self) { url in
            ImageView(url: url)
                .navigationTransition(.zoom(sourceID: url, in: ProfileNamespace))
        }
    }
}

private struct ImageView: View {
    let url: String
    
    var body: some View {
        ZStack {
            KFImage(URL(string: url))
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


let testingURLs = [
    "https://images.unsplash.com/photo-1742240216264-f0aac25ef4ba?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1743710426934-89887ca897d8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzfHx8ZW58MHx8fHx8",
    "https://images.unsplash.com/photo-1744059510494-3e071c0b3596?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1744754222043-c337f2728640?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxMnx8fGVufDB8fHx8fA%3D%3D"
]
