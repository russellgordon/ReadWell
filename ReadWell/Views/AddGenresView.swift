//
//  AddGenresView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import SwiftUI

struct AddGenresView: View {
    
    // MARK: Stored properties
    
    // What new genre is being added
    @State private var newGenre = ""
    
    // Whether this view is showing in a sheet
    @Binding var isShowing: Bool
    
    // The list of genres (provided by parent view)
    @Binding var existingGenres: [Genre]
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                Section("Genre") {
                    TextField("Add new genre here", text: $newGenre)
                }
            }
            .navigationTitle("Add Genre")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        // Hide the sheet
                        isShowing = false
                        
                        // Add the new genre to the list of existing genres
                        existingGenres.append(Genre(name: newGenre))
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

#Preview {
    AddGenresView(
        isShowing: Binding.constant(true),
        existingGenres: Binding.constant(exampleGenres)
    )
}
