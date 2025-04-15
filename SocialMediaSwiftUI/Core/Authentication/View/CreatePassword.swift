//
//  CreatePassword.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct CreatePassword: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        AddDetailView(
            isPasswordField: true,
            title: Strings.createPassword,
            label: Strings.password,
            infoText: Strings.passwordMustBe6CharsLong,
            text: $viewModel.password
        ) {
            CompleteSignUpView()
        }
    }
}

#Preview {
    CreatePassword()
}
