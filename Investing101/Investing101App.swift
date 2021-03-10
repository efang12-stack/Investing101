//
//  Investing101App.swift
//  Investing101
//
//  Created by Ethan on 1/12/21.
//

import SwiftUI

@main
struct Investing101App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var videoManager = VideoManager()
    @StateObject var savedVideoManager = SavedVideoManager()
    @StateObject var savedArticleManager = SavedArticleManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
