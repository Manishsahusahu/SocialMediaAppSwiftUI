//
//  AddDetailView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 11/04/25.
//

import SwiftUI

struct AddDetailView<Content: View>: View {
    let title: String
    let label: String
    let infoText: String
    @Binding var text: String
    let childView: () -> Content
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text(infoText)
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField(label, text: $text)
                .textInputAutocapitalization(.none)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal, 24)
                .padding(.top)
            
            NavigationLink {
                childView()
            } label: {
                Text(Strings.next)
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
