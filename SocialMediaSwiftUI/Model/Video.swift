//
//  Video.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 02/05/25.
//

import Foundation

struct Video: Codable, Identifiable, Hashable {
    let sources: [String]
    
    var id: String {
        sources.first ?? UUID().uuidString
    }
}
