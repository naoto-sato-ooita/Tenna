//
//  Tenna2App.swift
//  Tenna2
//
//  Created by Naoto Sato on 2024/04/11.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct Tenna2App: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if AuthViewModel.shared.getCurrentUser() != nil {
                    ContentView()
                } else {
                    LoginAuthView()
                }
            }
        }
    }
}
