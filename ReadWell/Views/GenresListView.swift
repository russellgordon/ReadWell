//
//  GenresListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct GenresListView: View {
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Text("Genres")
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    GenresListView()
}
