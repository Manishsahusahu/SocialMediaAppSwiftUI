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
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(from item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        await MainActor.run {
            self.profileImage = Image(uiImage: uiImage)
        }
    }
    
    func updateUserData() {
        self.isLoading = true
        var data: [String: Any] = .init()
        
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
                self.isLoading = false
            }
        }
    }
}
