//
//  UtilityExtensions.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 01/05/25.
//

import Foundation

extension Date {
    func relativeTimeDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
