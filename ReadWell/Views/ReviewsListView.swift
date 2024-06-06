//
//  ReviewsListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct ReviewsListView: View {
    
    // MARK: Stored properties
    
    // Whether the sheet to add a new review is showing or not
    @State private var addNewReviewSheetIsShowing = false
    
    // The list of reviews currently defined in the app
    // NOTE: We add a few example reviews
    @State private var reviews = exampleReviews
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                
                List(reviews) { review in

                    NavigationLink {
                        ReviewDetailView(reviewToShow: review)
                    } label: {
                        Text(review.title)
                    }


                }
                .listStyle(.plain)
                .background {
                    Color.readWellBrown
                        .ignoresSafeArea()
                }
                .toolbarBackground(Color.tabBar, for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .searchable(text: Binding.constant(""))
                
            }
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
}

#Preview {
    ReviewsListView()
}
