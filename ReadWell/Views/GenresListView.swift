//
//  GenresListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct GenresListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Color.green
                    .ignoresSafeArea()
            }
            .navigationTitle("Genres")
        }
    }
}

#Preview {
    GenresListView()
}
