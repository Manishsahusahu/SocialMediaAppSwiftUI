//
//  EditProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject private var viewModel: EditProfileViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: .init(user: user))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.done,
                principalText: Strings.editProfile,
                isTrailingActionDisabled: viewModel.selectedImage == nil
            ) {
                dismiss()
            } trailingAction: {
                viewModel.editData()
            }
            
            Spacer().frame(height: 16)
            
            Divider()
            
            Spacer().frame(height: 16)
            
            PhotosPicker(selection: $viewModel.selectedImage, matching: .images) {
                VStack {
                    Group {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 80)
                                .clipped()
                        } else {
                            Image(systemName: ImageName.person)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                        }
                    }
                    .clipShape(Circle())
                    
                    Text(Strings.editProfilePicture)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            
            Spacer().frame(height: 12)
            
            TextFieldRowView(title: Strings.name, placeholder: Strings.enterYourName, value: $viewModel.name)
            
            TextFieldRowView(title: Strings.bio, placeholder: Strings.enterYourBio, value: $viewModel.bio)
            
            Spacer()
        }
        .onChange(of: viewModel.isLoading) { _, newValue in
            if !newValue {
                dismiss()
            }
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

private struct TextFieldRowView: View {
    let title: String
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $value)
                
                Divider()
            }
        }
        .font(.subheadline)
        .padding(.vertical, 8)
    }
}
