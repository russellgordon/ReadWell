//
//  ReviewsListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct ReviewsListView: View {
    
    // MARK: Stored properties
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                Color.yellow
                    .ignoresSafeArea()
            }
            .navigationTitle("Reviews")
        }
            
    }
}

#Preview {
    ReviewsListView()
}
