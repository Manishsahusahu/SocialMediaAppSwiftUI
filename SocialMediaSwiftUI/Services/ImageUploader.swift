//
//  ImageUploader.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import Firebase
import FirebaseStorage
import SwiftUI

class ImageUploader {
    static func UploadImage(image: UIImage, for uploadFor: UploadFor) async -> String? {
        guard let userId = AuthService.shared.currentUser?.id else { return nil }
        guard let imageData = image.jpegData(
            compressionQuality: uploadFor.compressionQuality
        ) else { return nil }
        
        let fileName = UUID().uuidString
        let path = "/\(uploadFor.path)/\(userId)/\(fileName)"
        let ref = Storage.storage().reference(withPath: path)
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            return try await ref.downloadURL().absoluteString
        } catch {
            print("Failed to upload image: \(error.localizedDescription)")
            return nil
        }
    }
    
    enum UploadFor {
        case profile
        case post
        
        var path: String {
            switch self {
            case .post: return "posts_image"
            case .profile: return "profile_image"
            }
        }
        
        var compressionQuality: CGFloat {
            switch self {
            case .post: return 0.5
            case .profile: return 0.3
            }
        }
    }
}
