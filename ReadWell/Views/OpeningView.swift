//
//  OpeningView.swift
//  ReadWell
//
//  Created by Russell Gordon on 2024-06-05.
//

import SwiftUI

struct OpeningView: View {
    
    // MARK: Stored properties
    @State private var hasChosenGetStarted = false
    
    // MARK: Computed properties
    var body: some View {
        
        if hasChosenGetStarted == false {
            SplashScreenView(getStarted: $hasChosenGetStarted)
        } else {
            LandingView()
        }
        
        
    }
}

#Preview {
    OpeningView()
}
