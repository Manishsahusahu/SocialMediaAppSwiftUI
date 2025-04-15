//
//  CreatePostView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @ObservedObject var viewModel: UploadPostViewModel
    
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        HStack(spacing: 8) {
            Group {
                if let image = viewModel.image {
                    image
                        .resizable()
                } else {
                    Color(.systemGray)
                }
            }
            .frame(width: 100, height: 100)
            
            TextField(
                "Enter your caption...",
                text: $viewModel.caption,
                axis: .vertical
            )
        }
        .padding()
        .onAppear {
            isImagePickerPresented.toggle()
        }
        .photosPicker(
            isPresented: $isImagePickerPresented,
            selection: $viewModel.selectedImage
        )
    }
}
