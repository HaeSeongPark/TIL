//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by rhino Q on 2023/01/21.
// https://developer.apple.com/tutorials/swiftui/creating-and-combining-views

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
