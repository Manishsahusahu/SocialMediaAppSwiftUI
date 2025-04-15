//
//  AddEmailView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject private var viewModel: RegistrationViewModel
    
    var body: some View {
        AddDetailView(
            title: Strings.addYourEmail,
            label: Strings.email,
            infoText: Strings.youWillUseThisEmail,
            text: $viewModel.email
        ) {
            CreateUserNameView()
        }
    }
}

#Preview {
    AddEmailView()
}
