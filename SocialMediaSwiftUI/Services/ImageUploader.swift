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
    static func UploadImage(image: UIImage) async -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")
        
        do {
            let _ = try await ref.putDataAsync(imageData)
            return try await ref.downloadURL().absoluteString
        } catch {
            print("Failed to upload image: \(error.localizedDescription)")
            return nil
        }
    }
}
