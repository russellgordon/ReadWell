//
//  LandingView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct LandingView: View {
    
    // MARK: Stored properties
    
    
    // MARK: Computed properties
    var body: some View {
        
        TabView {
            
            ReviewsListView()
            .tabItem {
                Image(systemName: "books.vertical.fill")
                Text("Reviews")
            }

            StatisticsView()
            .tabItem {
                Image(systemName: "chart.pie.fill")
                Text("Statistics")
            }

            GenresListView()
            .tabItem {
                Image(systemName: "theatermasks.fill")
                Text("Genres")
            }
            
        }
    }
}

#Preview {
    LandingView()
}
