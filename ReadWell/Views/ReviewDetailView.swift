//
//  ReviewDetailView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import SwiftUI

struct ReviewDetailView: View {
    
    // Static details for "Pride and Prejudice" by Jane Austen
    let title: String = "Pride and Prejudice"
    let author: String = "Jane Austen"
    let genre: String = "Romance"
    let dateStarted: Date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date()
    let dateFinished: Date = Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 20)) ?? Date()
    let starRating: Int = 5
    let review: String = """
    Pride and Prejudice is a romantic novel of manners written by Jane Austen in 1813. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and eventually comes to appreciate the difference between superficial goodness and actual goodness. Its humour lies in its honest depiction of manners, education, marriage, and money during the Regency era in Great Britain.
    """
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("by \(author)")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Group {
                    Text("Genre")
                        .font(.headline)
                    Text(genre)
                }
                
                Group {
                    Text("Date Started")
                        .font(.headline)
                    Text(formatDate(dateStarted))
                }
                
                Group {
                    Text("Date Finished")
                        .font(.headline)
                    Text(formatDate(dateFinished))
                }
                
                Group {
                    Text("Star Rating")
                        .font(.headline)
                    HStack {
                        ForEach(0..<starRating) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                        ForEach(starRating..<5) { _ in
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Group {
                    Text("Review")
                        .font(.headline)
                    Text(review)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Pride and Prejudice")
    }
    
    // Helper function to format dates
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    ReviewDetailView()
}
