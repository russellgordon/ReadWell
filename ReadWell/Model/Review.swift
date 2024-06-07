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
    let genre: String
    let dateStarted: Date
    let dateFinished: Date
    let starRating: Int
    let review: String
    
}

// Instance 1: Romance
let romanceReview = Review(
    title: "The Notebook",
    author: "Nicholas Sparks",
    genre: "Romance",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 1))!,
    dateFinished: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 5))!,
    starRating: 5,
    review: "A touching and heartwarming story of love that transcends time. Sparks' writing beautifully captures the emotional depth of the characters."
)

// Instance 2: Science Fiction
let scienceFictionReview = Review(
    title: "Dune",
    author: "Frank Herbert",
    genre: "Science Fiction",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 15))!,
    dateFinished: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 1))!,
    starRating: 5,
    review: "A masterpiece of science fiction. Herbert's world-building and intricate plot make 'Dune' a compelling and thought-provoking read."
)

// Instance 3: Non-fiction
let nonFictionReview = Review(
    title: "Sapiens: A Brief History of Humankind",
    author: "Yuval Noah Harari",
    genre: "Non-fiction",
    dateStarted: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 10))!,
    dateFinished: Calendar.current.date(from: DateComponents(year: 2024, month: 1, day: 20))!,
    starRating: 4,
    review: "An enlightening exploration of human history. Harari presents complex ideas in a readable and engaging manner, offering profound insights into our species."
)

// Example data
let exampleReviews = [
    romanceReview,
    scienceFictionReview,
    nonFictionReview
]
