//
//  UploadPostView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct UploadPostView: View {
    let gotoFeed: () -> Void
    let reload: () -> Void
    
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.upload,
                principalText: Strings.newPost,
                isTrailingActionDisabled: isTrailingActionDisabled,
                leadingAction: clearAndClose,
                trailingAction: uploadAction
            )
            
            CreatePostView(viewModel: viewModel)
            
            Spacer()
        }
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.15))
            }
        }
    }
}

private extension UploadPostView {
    private func cleanup() {
        viewModel.image = nil
        viewModel.selectedImage = nil
        viewModel.caption = ""
        viewModel.isLoading = false
    }
    
    private func clearAndClose() {
        cleanup()
        gotoFeed()
    }
    
    private func uploadAction() {
        Task {
            await viewModel.uploadPost()
            clearAndClose()
            reload()
        }
    }
    
    private var isTrailingActionDisabled: Bool {
        viewModel.selectedImage == nil
    }
}
