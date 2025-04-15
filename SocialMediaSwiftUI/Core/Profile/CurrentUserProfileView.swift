//
//  CurrentUserProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 15/04/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            ProfileView(user: user)
        }
    }
}
