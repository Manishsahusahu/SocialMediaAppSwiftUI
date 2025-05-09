//
//  ProfileImageView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    let imageURL: String?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageURL {
            KFImage.url(URL(string: imageURL))
                .placeholder {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: size.value, height: size.value)
                }
                .resizable()
                .scaledToFill()
                .frame(width: size.value, height: size.value)
                .clipShape(Circle())
        } else {
            Circle()
                .fill(Color.gray)
                .frame(width: size.value, height: size.value)
        }
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
