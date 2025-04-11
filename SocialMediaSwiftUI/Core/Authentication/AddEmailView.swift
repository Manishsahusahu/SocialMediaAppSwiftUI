//
//  AddEmailView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct AddEmailView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(Strings.addYourEmail)
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text(Strings.youWillUseThisEmail)
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email")
        }
    }
}

#Preview {
    AddEmailView()
}
