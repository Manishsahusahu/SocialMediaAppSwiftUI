//
//  CreateUserNameView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct CreateUserNameView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        AddDetailView(
            title: Strings.createUserName,
            label: Strings.next,
            infoText: Strings.youWillUseUserName,
            text: $viewModel.username
        ) {
            CreatePassword()
        }
    }
}

#Preview {
    CreateUserNameView()
}
