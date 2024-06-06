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
