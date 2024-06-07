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
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(reviews) { review in
                Text(review.title)
            }
            .listStyle(.plain)
            .background {
                Color.readWellBrown
                    .ignoresSafeArea()
            }
            .toolbarBackground(Color.tabBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .searchable(text: Binding.constant(""))
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
                AddReviewView(isShowing: $addNewReviewSheetIsShowing)
            }
            .navigationTitle("Reviews")
        }
            
    }
}

#Preview {
    ReviewsListView()
}
