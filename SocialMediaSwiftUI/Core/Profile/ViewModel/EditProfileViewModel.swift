//
//  EditProfileViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestore
import Kingfisher
import Combine

class EditProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage)
            }
        }
    }
    @Published var profileImage: Image?
    @Published var name: String = ""
    @Published var bio: String = ""
    
    private var uiImage: UIImage?
    private var kfCancellable: Kingfisher.DownloadTask?
    
    init(user: User) {
        self.user = user
        self.name = user.fullName ?? ""
        self.bio = user.bio ?? ""
        loadExistingImage()
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.uiImage = uiImage
        await MainActor.run {
            self.profileImage = Image(uiImage: uiImage)
        }
    }
    
    func editData() {
        Task {
            await MainActor.run { isLoading = true }
            await updateUserDataInStore()
            await MainActor.run { isLoading = false }
        }
    }
    
    private func updateUserDataInStore() async {
        var data: [String: Any] = .init()
        
        if let uiImage {
            let imageURL = await ImageUploader.UploadImage(image: uiImage, for: .profile)
            data["profileImageUrl"] = imageURL
        }
        if !name.isEmpty, name != user.username {
            data["fullName"] = name
        }
        if !bio.isEmpty, bio != user.bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            Firestore.firestore().collection("users").document(user.id).updateData(data) { error in
                switch error {
                case .none:
                    Task {
                        try? await AuthService.shared.loadUserData()
                    }
                case .some(let error): print("Error updating user data: \(error)")
                }
            }
        }
    }
    
    private func loadExistingImage() {
        guard let urlString = user.profileImageUrl else { return }
        guard let url = URL(string: urlString) else { return }
        
        let resource = KF.ImageResource(downloadURL: url)
        kfCancellable = KingfisherManager.shared.retrieveImage(with: resource) { [weak self] result in
            switch result {
            case .success(let image): self?.profileImage = Image(uiImage: image.image)
            case .failure(let error):
                print("Failed to fetch image: \(error)")
            }
        }
    }
}
