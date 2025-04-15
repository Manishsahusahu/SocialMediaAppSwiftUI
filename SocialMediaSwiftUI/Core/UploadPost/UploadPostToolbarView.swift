//
//  UploadPostToolbarView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct UploadPostToolbarView: View {
    var body: some View {
        HStack {
            Button {} label: {
                Text("Cancel")
            }
            
            Spacer()
            
            Text("New Post")
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {} label: {
                Text("Upload")
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal)
    }
}
