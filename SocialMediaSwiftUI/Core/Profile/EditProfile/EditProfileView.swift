//
//  EditProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            ToolbarView(
                leadingText: Strings.cancel,
                trailingText: Strings.done,
                principalText: Strings.editProfile
            ) {
                dismiss()
            } trailingAction: {}
            
        }
    }
}
