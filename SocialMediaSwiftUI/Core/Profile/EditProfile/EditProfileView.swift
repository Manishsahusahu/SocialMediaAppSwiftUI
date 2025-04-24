//
//  EditProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var selectedImage: PhotosPickerItem?
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.done,
                principalText: Strings.editProfile
            ) {
                dismiss()
            } trailingAction: {}
            
            Spacer().frame(height: 16)
            
            Divider()
            
            Spacer().frame(height: 16)
            
            PhotosPicker(selection: $selectedImage) {
                VStack {
                    Circle()
                        .fill(Color(.systemGray))
                        .frame(width: 80, height: 80)
                    
                    Text(Strings.editProfilePicture)
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            
            Spacer()
        }
    }
}

private struct TextFieldRowView: View {
    let title: String
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text(title)
        }
    }
}
