//
//  StatisticsView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct StatisticsView: View {
    // MARK: Stored properties
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                Color.purple
                    .ignoresSafeArea()
            }
            .navigationTitle("Statistics")
        }
    }
}

#Preview {
    StatisticsView()
}
