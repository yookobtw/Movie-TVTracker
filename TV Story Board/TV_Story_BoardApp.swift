//
//  TV_Story_BoardApp.swift
//  TV Story Board
//
//  Created by Sayat Amanzhol on 22.06.2026.
//

import SwiftUI
import SwiftData

@main
struct TV_Story_BoardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Title.self)
    }
}
