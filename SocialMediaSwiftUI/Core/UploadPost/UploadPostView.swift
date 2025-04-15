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
            UploadPostToolbarView() {
                viewModel.image = nil
                viewModel.selectedImage = nil
                
            }
            
            CreatePostView(viewModel: viewModel)
            
            Spacer()
        }
    }
}

#Preview {
    UploadPostView()
}
