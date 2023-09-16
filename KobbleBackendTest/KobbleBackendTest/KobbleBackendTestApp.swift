//
//  KobbleBackendTestApp.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 6/10/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

class navclass: ObservableObject {
    @Published var adc: [HomeViews] = []
}

@main
struct KobbleBackendTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            VSignUpRoot()
        }
    }
}
