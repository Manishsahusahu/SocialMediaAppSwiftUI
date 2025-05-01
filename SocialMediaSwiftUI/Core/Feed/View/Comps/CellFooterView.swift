//
//  CellFooterView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct CellFooterView: View {
    let likes: Int
    let caption: String
    let fullname: String
    let timeAgo: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.top, 1)
            
            HStack {
                Text("\(fullname) ")
                    .fontWeight(.semibold) +
                Text(caption)
            }
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.top, 1)
            
            Text(timeAgo)
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.top, 1)
        }
    }
}
