//
//  Review.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import Foundation

struct Review: Identifiable {
    
    // MARK: Stored properties
    let id = UUID()
    let title: String
    let author: String
    let genre: Genre
    let dateStarted: Date
    let dateFinished: Date
    let starRating: Int
    let review: String
    
}

let review1 = Review(
    title: "Dune",
    author: "Frank Herbert",
    genre: Genre(name: "Science Fiction"),
    dateStarted: Date(timeIntervalSince1970: 1672531200), // 2023/01/01
    dateFinished: Date(timeIntervalSince1970: 1673740800), // 2023/01/15
    starRating: 5,
    review: "A masterful science fiction epic with deep world-building and complex characters."
)

let review2 = Review(
    title: "Outlander",
    author: "Diana Gabaldon",
    genre: Genre(name: "Romance"),
    dateStarted: Date(timeIntervalSince1970: 1675209600), // 2023/02/01
    dateFinished: Date(timeIntervalSince1970: 1676851200), // 2023/02/20
    starRating: 4,
    review: "A captivating blend of historical fiction, romance, and time travel."
)

let review3 = Review(
    title: "Pride and Prejudice",
    author: "Jane Austen",
    genre: Genre(name: "Romance"),
    dateStarted: Date(timeIntervalSince1970: 1677628800), // 2023/03/01
    dateFinished: Date(timeIntervalSince1970: 1678406400), // 2023/03/10
    starRating: 5,
    review: "A timeless classic that explores themes of love, class, and social expectations."
)

let exampleReviews: [Review] = [review1, review2, review3]
