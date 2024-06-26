//
//  AddReviewView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

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
    
    // Obtain a reference to the source of truth for our book reviews
    @Binding var reviews: [Review]

    // MARK: Computed properties
    
    // Returns true when any of the input fields does not have a value
    var atLeastOneInputFieldIsBlank: Bool {
        return title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty
    }
    
    // Our user interface
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Book Details")) {
                    
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Genre", text: $genre)

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
                    .disabled(atLeastOneInputFieldIsBlank)

                }
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
