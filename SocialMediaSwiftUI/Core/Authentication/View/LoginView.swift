//
//  LoginView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                HeaderView()
                
                InputFields(viewModel: viewModel)
                
                Spacer()
                
                Divider()
                
                SignUpAction()
            }
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        Text(Strings.ManishSahu)
            .font(.largeTitle)
            .bold()
    }
}

private struct InputFields: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField(Strings.enterYourEmail, text: $viewModel.email)
                .modifier(TextFieldModifier())
            
            SecureField(Strings.password, text: $viewModel.password)
                .modifier(TextFieldModifier())
            
            Button {
                viewModel.login()
            } label: {
                Text(Strings.login)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

private struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 24)
    }
}

private struct SignUpAction: View {
    var body: some View {
        NavigationLink {
            AddEmailView()
        } label: {
            HStack(spacing: 3) {
                Text(Strings.donthaveaccount)
                
                Text(Strings.signup)
                    .fontWeight(.semibold)
            }
            .font(.footnote)
        }
        .padding(.vertical)
    }
}

#Preview {
    LoginView()
}
