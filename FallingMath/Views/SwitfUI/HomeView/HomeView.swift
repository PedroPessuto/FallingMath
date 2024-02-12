//
//  HomeView.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 01/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(GameController.self) private var gameController
    
    var body: some View {
        OnboardingView()
        
    }
}
