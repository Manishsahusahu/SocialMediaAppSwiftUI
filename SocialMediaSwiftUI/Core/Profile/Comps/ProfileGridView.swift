//
//  ProfileGridView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(0..<20, id: \.self) { _ in
                Rectangle()
                    .fill(Color.blue)
                    .frame(height: 140)
            }
        }
    }
}
