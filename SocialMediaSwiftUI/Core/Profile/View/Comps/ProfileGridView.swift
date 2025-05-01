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
                
                NavigationLink(value: post) {
                    ImageWrapper(url: url, id: post.id, namespace: ProfileNamespace)
                }
            }
        }
        .navigationDestination(for: Post.self) { post in
            FeedCellView(post: post)
                .navigationTransition(.zoom(sourceID: post.id, in: ProfileNamespace))
        }
    }
}

private struct FeedCellView: View {
    let post: Post
    
    var body: some View {
        VStack {
            FeedCell(post: post)
            
            Spacer()
        }
        .padding(.top, 24)
    }
}

private struct ImageWrapper: UIViewRepresentable {
    let url: String
    let id: String
    let namespace: Namespace.ID
    
    func makeUIView(context: Context) -> UIView {
        let hostingController = UIHostingController(
            rootView:
                KFImage(URL(string: url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 3 - 2, height: 140)
                    .matchedTransitionSource(id: id, in: namespace)
            
        )
        
        return hostingController.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
