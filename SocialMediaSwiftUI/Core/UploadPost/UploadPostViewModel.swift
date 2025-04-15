//
//  UploadPostViewModel.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import Foundation
import PhotosUI
import SwiftUI

class UploadPostViewModel: ObservableObject {
    @Published var image: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage )
            }
        }
    }
    
    private func loadImage(from item: PhotosPickerItem?) async {
        guard let item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        
        self.image = Image(uiImage: uiImage)
    }
}
