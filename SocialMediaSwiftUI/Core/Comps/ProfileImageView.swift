//
//  ProfileImageView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileImageView: View {
    let size: ProfileImageSize
    
    var body: some View {
        Circle()
            .fill(Color.gray)
            .frame(width: size.value, height: size.value)
    }
}

enum ProfileImageSize {
    case small
    case medium
    case large
    
    var value: CGFloat {
        switch self {
        case .small:
            return 40
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}
