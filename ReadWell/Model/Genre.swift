//
//  Genre.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-06.
//

import Foundation

struct Genre: Identifiable {
    var id = UUID()
    var name: String
}

let exampleGenres = [
    Genre(name: "Romance"),
    Genre(name: "Science Fiction"),
]
