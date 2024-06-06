//
//  ReviewsListView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct ReviewsListView: View {
    
    // MARK: Stored properties
    @State private var selectedPresentationType: Int = 1
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                
                Picker("Presenting by...", selection: $selectedPresentationType) {
                    Text("By Title").tag(1)
                    Text("By Author").tag(2)
                    Text("By Genre").tag(3)
                }
                .pickerStyle(.segmented)
                .padding()
                
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
                
            }
            .navigationTitle("Reviews")
        }
            
    }
}

#Preview {
    ReviewsListView()
}
