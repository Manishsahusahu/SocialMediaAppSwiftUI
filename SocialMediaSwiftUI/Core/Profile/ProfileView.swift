//
//  ProfileView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    ProfileHeaderView()
                    
                    ProfileGridView()
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}


#Preview {
    ProfileView()
}
