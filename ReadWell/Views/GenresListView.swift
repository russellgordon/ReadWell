//
//  GenresListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct GenresListView: View {
    
    // MARK: Stored properties
    @State private var searchText = ""
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List {
                Text("Romance")
                Text("Science Fiction")
            }
            .searchable(text: $searchText)
            .background {
                Color.readWellBrown
                    .ignoresSafeArea()
            }
            .toolbarBackground(Color.tabBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Show the NewGenreView
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .listStyle(.plain)
            .navigationTitle("Genres")
        }
    }
}

#Preview {
    GenresListView()
}
