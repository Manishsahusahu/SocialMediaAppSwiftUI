//
//  UploadPostViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
import FirebaseFirestore

class UploadPostViewModel: ObservableObject {
    @Published var caption: String = ""
    @Published var image: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage )
            }
        }
    }
    private var uiImage: UIImage?
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        await setImage(uiImage: uiImage)
    }
    
    @MainActor
    private func setImage(uiImage: UIImage) {
        self.image = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) {
        Task {
            do {
                guard let uid = AuthService.shared.currentUser?.id else { return }
                guard let uiImage else { return }
                guard let imageURL = await ImageUploader.UploadImage(image: uiImage) else { return }
                
                let postRef = Firestore.firestore().collection("posts").document()
                let post = Post(
                    id: postRef.documentID,
                    ownerUid: uid,
                    caption: caption,
                    likes: 0,
                    imageUrl: imageURL,
                    timestamp: Timestamp()
                )
                
                let encodedPost = try Firestore.Encoder().encode(post)
                try await postRef.setData(encodedPost)
            } catch {
                print("Failed to upload post: \(error.localizedDescription)")
            }
        }
    }
}
