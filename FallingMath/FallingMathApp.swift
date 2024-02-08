//
//  FallingMathApp.swift
//  FallingMath
//
//  Created by Pedro Pessuto on 20/12/23.
//

import SwiftUI
import SwiftData

@main
struct FallingMathApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: SavedData.self)
    }
}
