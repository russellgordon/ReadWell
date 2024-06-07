//
//  ReviewsListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct ReviewsListView: View {
    
    // MARK: Stored properties
    @State private var addNewReviewSheetIsShowing = false
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List {
                Text("Dune")
                Text("Outlander")
                Text("Pride and Prejudice")
            }
            .listStyle(.plain)
            .background {
                Color.readWellBrown
                    .ignoresSafeArea()
            }
            .toolbarBackground(Color.tabBar, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .searchable(text: Binding.constant(""))
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        // This would show the add review sheet
                        addNewReviewSheetIsShowing = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                
            }
            .sheet(isPresented: $addNewReviewSheetIsShowing) {
                AddReviewView(isShowing: $addNewReviewSheetIsShowing)
            }
            .navigationTitle("Reviews")
        }
            
    }
}

#Preview {
    ReviewsListView()
}
