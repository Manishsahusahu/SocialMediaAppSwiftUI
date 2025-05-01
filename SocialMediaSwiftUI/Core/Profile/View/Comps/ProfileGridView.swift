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
                    ImageWrapper(url: url, namespace: ProfileNamespace)
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

private struct ImageWrapper: UIViewRepresentable {
    let url: String
    let namespace: Namespace.ID
    
    func makeUIView(context: Context) -> UIView {
        let hostingController = UIHostingController(
            rootView:
                KFImage(URL(string: url))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width / 3 - 2, height: 140)
                    .matchedTransitionSource(id: url, in: namespace)
            
        )
        
        return hostingController.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
