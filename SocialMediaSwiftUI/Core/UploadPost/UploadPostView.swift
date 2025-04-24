//
//  UploadPostView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct UploadPostView: View {
    @StateObject private var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.upload,
                principalText: Strings.newPost
            ) {
                viewModel.image = nil
                viewModel.selectedImage = nil
            } trailingAction: {}
            
            CreatePostView(viewModel: viewModel)
            
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
