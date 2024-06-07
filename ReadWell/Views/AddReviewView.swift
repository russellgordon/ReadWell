//
//  AddReviewView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import PhotosUI
import SwiftUI

struct AddReviewView: View {
    
    // MARK: Stored properties
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = ""
    @State private var dateStarted: Date = Date()
    @State private var dateFinished: Date = Date()
    @State private var starRating: Int = 1
    @State private var review: String = ""
    
    // Allow us to dismiss this sheet
    @Binding var isShowing: Bool
    
    // The list of reviews (source of truth is on the parent view)
    @Binding var reviews: [Review]
    
    // The selection made in the PhotosPicker
    @State var selectionResult: PhotosPickerItem?

    // The actual image loaded from the selection that was made
    @State var newReviewBookCoverImage: BookCoverImage?

    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Book Details")) {
                    
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Genre", text: $genre)
                    
                    PhotosPicker(selection: $selectionResult, matching: .images) {
                        
                        // Has an image been loaded?
                        if let newReviewBookCoverImage = newReviewBookCoverImage {
                            
                            // Yes, show it
                            newReviewBookCoverImage.image
                                .resizable()
                                .scaledToFit()

                        } else {
                            
                            // No, show an icon instead
                            Image(systemName: "photo.badge.plus")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 30))
                                .foregroundStyle(.tint)
                            
                        }
                    }
                    .frame(height: 100)

                }
                
                Section(header: Text("Reading Dates")) {
                    DatePicker("Date Started", selection: $dateStarted, in: ...Date(), displayedComponents: .date)
                    DatePicker("Date Finished", selection: $dateFinished, in: ...Date(), displayedComponents: .date)
                }
                
                Section(header: Text("Rating")) {
                    Picker("Star Rating", selection: $starRating) {
                        Text("★").tag(1)
                        Text("★★").tag(2)
                        Text("★★★").tag(3)
                        Text("★★★★").tag(4)
                        Text("★★★★★").tag(5)
                    }
                    .pickerStyle(.menu)
                    
                }
                
                Section(header: Text("Review")) {
                    TextEditor(text: $review)
                        .frame(height: 200)
                }


            }
            .navigationTitle("Add Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        // Add the new book review
                        let newReview = Review(
                            title: title,
                            coverImage: newReviewBookCoverImage!.image,
                            author: author,
                            genre: genre,
                            dateStarted: dateStarted,
                            dateFinished: dateFinished,
                            starRating: starRating,
                            review: review
                        )
                        reviews.append(newReview)
                        
                        // ... and dismiss the sheet
                        isShowing = false
                        
                    } label: {
                        Text("Done")
                    }
                    .disabled(newReviewBookCoverImage == nil)

                }
            }
            // This block of code is invoked whenever the selection from the picker changes
            .onChange(of: selectionResult) {
                // When the selection result is not nil...
                if let imageSelection = selectionResult {
                    // ... transfer the data from the selection result into
                    // an actual instance of TodoItemImage
                    loadTransferable(from: imageSelection)
                }
            }
        }
    }
    
    // MARK: Functions

    // Transfer the data from the PhotosPicker selection result into the stored property that
    // will hold the actual image for the new to-do item
    private func loadTransferable(from imageSelection: PhotosPickerItem) {
        Task {
            do {
                // Attempt to set the stored property that holds the image data
                newReviewBookCoverImage = try await imageSelection.loadTransferable(type: BookCoverImage.self)
            } catch {
                debugPrint(error)
            }
        }
    }
}

#Preview {
    AddReviewView(
        isShowing: Binding.constant(true),
        reviews: Binding.constant(exampleReviews)
    )
}
