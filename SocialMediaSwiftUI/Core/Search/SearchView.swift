//
//  SearchView.swift
//  SocialMediaSwiftUI
//
//  Created by Manish sahu on 10/04/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<10, id: \.self) { _ in
                        HStack {
                            ProfileImageView(size: .small)
                            
                            profileMetaView()
                        }
                    }
                }
                .padding()
                .searchable(text: $searchText, prompt: "Search...")
            }
            .scrollIndicators(.hidden )
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct profileMetaView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Don Manish")
                .fontWeight(.semibold)
                
            Text("Software Engineer")
        }
        .font(.footnote)
    }
}

#Preview {
    SearchView()
}
