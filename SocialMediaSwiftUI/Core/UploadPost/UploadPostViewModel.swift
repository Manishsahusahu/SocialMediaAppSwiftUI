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
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            Task {
                await loadImage(from: selectedImage )
            }
        }
    }
    
    private func loadImage(from item: PhotosPickerItem?) async {
        
    }
}
