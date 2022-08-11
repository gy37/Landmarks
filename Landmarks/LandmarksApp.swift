//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by gaoshenyu on 2022/6/26.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        #if !os(watchOS)
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        .commands {
            LandmarkCommands()
        }
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
        #else
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
