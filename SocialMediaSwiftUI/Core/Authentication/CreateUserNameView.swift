//
//  CreateUserNameView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct CreateUserNameView: View {
    @State var name: String = ""
    
    var body: some View {
        AddDetailView(
            title: Strings.createUserName,
            label: "Name",
            infoText: Strings.youWillUseUserName,
            text: $name
        ) {
            EmptyView()
        }
    }
}

#Preview {
    CreateUserNameView()
}
