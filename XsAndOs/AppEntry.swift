//
//  XsAndOsApp.swift
//  XsAndOs
//
//  Created by Macbook on 12/07/2023.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
