//
//  SearchView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10, id: \.self) { _ in
                    HStack {
                        ProfileImageView(size: .small)
                            
                    }
                }
            }
        }
    }
}

#Preview {
    SearchView()
}