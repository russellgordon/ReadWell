//
//  ReviewsListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct ReviewsListView: View {
    
    // MARK: Stored properties
    
    // Whether the sheet to add a new review is showing
    @State private var addNewReviewSheetIsShowing = false
    
    // Source of truth for our list of book reviews
    @State private var reviews: [Review] = exampleReviews
    
    // Holds the search text provided by the user
    @State private var searchText: String = ""
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(
                filter(reviews, on: searchText)
            ) { review in
                Text(review.title)
            }
            .listStyle(.plain)
            .background {
                Color.readWellBrown
                    .ignoresSafeArea()
            }
            .toolbarBackground(Color.tabBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .searchable(text: $searchText)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        // This would show the add review sheet
                        addNewReviewSheetIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                
            }
            .sheet(isPresented: $addNewReviewSheetIsShowing) {
                AddReviewView(
                    isShowing: $addNewReviewSheetIsShowing,
                    reviews: $reviews
                )
            }
            .navigationTitle("Reviews")
        }
            
    }
    
    // MARK: Functions
    func filter(_ reviews: [Review], on providedText: String) -> [Review] {
        
        // If the provided text is empty, just return the original array
        if providedText.isEmpty {
            return reviews
        } else {
            
            // Make an empty array of reviews
            var filteredReviews: [Review] = []
            
            // Iterate over existing reviews
            for review in reviews {
                if review.title.lowercased().contains(providedText.lowercased()) {
                    filteredReviews.append(review)
                }
            }
            
            // Return the list of reviews that contained the provided text
            return filteredReviews
            
        }
        
    }
}

#Preview {
    ReviewsListView()
}
