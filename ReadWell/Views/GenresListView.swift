//
//  GenresListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct GenresListView: View {
    
    // MARK: Stored properties
    
    // What the user is filtering on
    @State private var searchText = ""
    
    // Whether the sheet to add a new genre is showing or not
    @State private var addNewGenreSheetIsShowing = false
    
    // The list of genres currently defined in the app
    // NOTE: We add a couple of example genres to
    // start (Romance and Sci-Fi)
    @State private var genres = exampleGenres
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(genres) { genre in
                Text(genre.name)
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
                        addNewGenreSheetIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .listStyle(.plain)
            .sheet(isPresented: $addNewGenreSheetIsShowing) {
                AddGenresView(
                    isShowing: $addNewGenreSheetIsShowing,
                    existingGenres: $genres
                )
                .presentationDetents([.fraction(0.33)])
            }
            .navigationTitle("Genres")
        }
    }
}

#Preview {
    GenresListView()
}
