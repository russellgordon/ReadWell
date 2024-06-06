//
//  AddGenresView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import SwiftUI

struct AddGenresView: View {
    
    // MARK: Stored properties
    @State private var newGenre = ""
    
    @Binding var isShowing: Bool
    
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
                        
                        // TODO: Add the genre
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

#Preview {
    AddGenresView(isShowing: Binding.constant(true))
}
