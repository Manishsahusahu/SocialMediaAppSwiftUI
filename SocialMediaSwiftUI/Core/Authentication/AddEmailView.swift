//
//  AddEmailView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
    
    var body: some View {
        AddDetailView(
            title: Strings.addYourEmail,
            label: "Email",
            infoText: Strings.youWillUseThisEmail,
            text: $email
        )
    }
}

#Preview {
    AddEmailView()
}
