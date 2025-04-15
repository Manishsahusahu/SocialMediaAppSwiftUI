//
//  CompleteSignUpView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 12/04/25.
//

import SwiftUI

struct CompleteSignUpView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Social Media, Manish")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Click below to complete registration and start using Social Media")
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {} label: {
                Text("Complete Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    CompleteSignUpView()
}
