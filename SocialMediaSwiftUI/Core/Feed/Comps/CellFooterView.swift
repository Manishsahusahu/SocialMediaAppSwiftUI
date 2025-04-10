//
//  CellFooterView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct CellFooterView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("2.2M likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.horizontal, 8)
                .padding(.top, 1)
            
            HStack {
                Text("Don Manish ")
                    .fontWeight(.semibold) +
                Text("This is some test caption for post.")
            }
            .font(.footnote)
            .padding(.horizontal, 8)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.horizontal, 8)
                .padding(.top, 1)
        }
    }
}
