//
//  ReviewDetailView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import SwiftUI

struct ReviewDetailView: View {
    
    // MARK: Stored properties
    // Receive a review to display
    let reviewToShow: Review
    
    // MARK: Computed properties
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("by \(reviewToShow.author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Divider()

                HStack {
                                        
                    VStack(alignment: .leading) {
                        Text("Genre")
                            .font(.headline)
                        Text(reviewToShow.genre)
                            .padding(.bottom, 16)
                        
                        Text("Date Started")
                            .font(.headline)
                        Text(formatted(reviewToShow.dateStarted))
                            .padding(.bottom, 16)
                        
                        Text("Date Finished")
                            .font(.headline)
                        Text(formatted(reviewToShow.dateFinished))
                            .padding(.bottom, 16)
                        
                        Spacer()
                    }


                }
                                
                Group {
                    Text("Star Rating")
                        .font(.headline)
                    HStack {
                        ForEach(0..<reviewToShow.starRating) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(reviewToShow.starRating..<5) { _ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Group {
                    Text("Review")
                        .font(.headline)
                    Text(reviewToShow.review)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(reviewToShow.title)
    }
    
    // MARK: Functions
    func formatted(_ date: Date) -> String {
        return date.formatted(.dateTime.day().month(.wide).year())
    }
    
}

#Preview {
    NavigationStack {
        ReviewDetailView(reviewToShow: nonFictionReview)
    }
}
