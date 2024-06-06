//
//  LandingView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUIIntrospect
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


        }
        // Ensure tab bar background color is always set
        .introspect(.tabView, on: .iOS(.v17)) { tabView in
            tabView.tabBar.backgroundColor = UIColor(Color.tabBar)
        }
        
    }
}

#Preview {
    LandingView()
}
