//
//  LoginView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            InputFields()
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
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your Email", text: $email)
                .modifier(TextFieldModifier()) 
            
            SecureField("Password", text: $password)
                .modifier(TextFieldModifier())
            
            Button(action: { }) {
                Text("Login")
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

#Preview {
    LoginView()
}
