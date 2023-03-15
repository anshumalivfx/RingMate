//
//  RingMateApp.swift
//  RingMate
//
//  Created by Anshumali Karna on 25/02/23.
//

import SwiftUI
import AppKit
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
        
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Clean up any resources if necessary
    }
}

@main
struct RingMateApp: App {
    let persistenceController = PersistenceController.shared
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainPageView()
                    
            }
            else {
                LoginPageView()
                    .frame(width: 300, height: 500)
            }
        }
        .windowStyle(.hiddenTitleBar)
        
    }
}
