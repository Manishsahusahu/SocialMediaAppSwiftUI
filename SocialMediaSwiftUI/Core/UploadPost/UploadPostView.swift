//
//  UploadPostView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct UploadPostView: View {
    @StateObject private var viewModel = UploadPostViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.upload,
                principalText: Strings.newPost,
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
        .onChange(of: viewModel.isLoading) { _, newValue in
            if !newValue {
                clearAndClose()
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
        dismiss()
    }
    
    private func uploadAction() {
        Task {
            await viewModel.uploadPost()
            clearAndClose()
        }
    }
}

#Preview {
    UploadPostView()
}
