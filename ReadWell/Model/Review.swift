//
//  Review.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import Foundation
import SwiftUI

struct Review: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let title: String
    let coverImage: Image
    let author: String
    let genre: String
    let dateStarted: Date
    let dateFinished: Date
    let starRating: Int
    let review: String
    
}

let review1 = Review(
    title: "Dune",
    coverImage: Image("Dune"),
    author: "Frank Herbert",
    genre: "Science Fiction",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 1)) ?? Date(), // 2023/01/01
    dateFinished: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 15)) ?? Date(), // 2023/01/15
    starRating: 5,
    review: "A masterful science fiction epic with deep world-building and complex characters."
)

let review2 = Review(
    title: "Outlander",
    coverImage: Image("Outlander"),
    author: "Diana Gabaldon",
    genre: "Romance",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 1)) ?? Date(), // 2023/02/01
    dateFinished: Calendar.current.date(from: DateComponents(year: 2023, month: 1, day: 20)) ?? Date(), // 2023/02/20
    starRating: 4,
    review: "A captivating blend of historical fiction, romance, and time travel."
)

let review3 = Review(
    title: "Pride and Prejudice",
    coverImage: Image("PrideAndPrejudice"),
    author: "Jane Austen",
    genre: "Romance",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 1)) ?? Date(), // 2023/03/01
    dateFinished: Calendar.current.date(from: DateComponents(year: 2023, month: 3, day: 10)) ?? Date(), // 2023/03/10
    starRating: 5,
    review: "A timeless classic that explores themes of love, class, and social expectations."
)

let exampleReviews: [Review] = [review1, review2, review3]
