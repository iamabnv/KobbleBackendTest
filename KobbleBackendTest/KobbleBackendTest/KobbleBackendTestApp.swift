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
    @Published var adc: [HomeViews] = [.BedRockNavView]
}

class CAppManager: ObservableObject {
    @Published var currentUserId: String = ""
}

@main
struct KobbleBackendTestApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var appManager: CAppManager = CAppManager()
    
    @StateObject var phh : navclass = navclass()
    
    @State var ds: [[String : Any]] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $phh.adc) {
                VSignUp_Final(userAns: $ds)
                    .navigationDestination(for: HomeViews.self) { hoem in
                        switch hoem {
                        
                        case .BedRockNavView:
                            BedrockNavView()
                        
                        case .SocialView:
                            BedrockNavView()
                        case .SearchView:
                            pewpewView(txt: "Search View")
                            
                        case .PlayView:
                            pewpewView(txt: "Play View")
                            
                        case .RequestsView:
                            pewpewView(txt: "Requests View")
                                .navigationBarBackButtonHidden()
                        case .SettingsView:
                            pewpewView(txt: "Settings View")
                                .navigationBarBackButtonHidden()
                        }
                    }
            }
            .environmentObject(phh)
            .environmentObject(appManager)
            
            
                
        }
    }
}
