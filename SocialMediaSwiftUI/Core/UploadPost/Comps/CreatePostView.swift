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
    @FocusState private var isFocused: Bool
    
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
            .onTapGesture {
                isImagePickerPresented.toggle()
            }
            
            TextField(
                "Enter your caption...",
                text: $viewModel.caption,
                axis: .vertical
            )
            .focused($isFocused)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        
                        Button { isFocused = false } label: {
                            Text(Strings.close)
                                .fontWeight(.bold)
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            isImagePickerPresented.toggle()
        }
        .photosPicker(
            isPresented: $isImagePickerPresented,
            selection: $viewModel.selectedImage,
            matching: .images
        )
    }
}
