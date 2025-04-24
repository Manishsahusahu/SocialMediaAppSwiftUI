//
//  EditProfileViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 24/04/25.
//

import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject {
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
}
