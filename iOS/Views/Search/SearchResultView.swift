//
//  SearchResultView.swift
//  Aidoku (iOS)
//
//  Created by Skitty on 1/16/22.
//

import SwiftUI

struct SearchResultView: View {
    let source: Source
    let search: String
    
    @State var results: [Manga]
    
    var body: some View {
        ScrollView {
            Spacer()
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 130), spacing: 12)], spacing: 12) {
                ForEach(results, id: \.self) { manga in
                    NavigationLink {
                        MangaView(manga: manga)
                    } label: {
                        LibraryGridCell(manga: manga)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("\"\(search)\"")
    }
}