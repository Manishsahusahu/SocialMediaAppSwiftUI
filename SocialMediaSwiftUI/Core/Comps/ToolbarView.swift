//
//  ToolbarView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI

struct ToolbarView: View {
    let leadingText: String
    let trailingText: String
    let principalText: String
    let leadingAction: () -> Void
    let trailingAction: () -> Void
    
    var body: some View {
        HStack {
            Button { leadingAction() } label: {
                Text(leadingText)
            }
            
            Spacer()
            
            Text(principalText)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button { trailingAction() } label: {
                Text(trailingText)
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal)
    }
}
