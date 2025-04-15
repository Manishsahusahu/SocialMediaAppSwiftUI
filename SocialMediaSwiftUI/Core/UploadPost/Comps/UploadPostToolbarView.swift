//
//  UploadPostToolbarView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct UploadPostToolbarView: View {
    let cancel: () -> Void
    
    var body: some View {
        HStack {
            Button { cancel() } label: {
                Text(Strings.cancel)
            }
            
            Spacer()
            
            Text(Strings.newPost)
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {} label: {
                Text(Strings.upload)
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal)
    }
}
