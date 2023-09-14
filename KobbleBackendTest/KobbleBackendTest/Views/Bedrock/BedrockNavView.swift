//
//  BedrockNavView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/7/23.
//

import SwiftUI

enum Tab {
    case home
    case profile
    case matches
}

struct BedrockNavView: View {
    @State var selectedTab: Tab = .home
    @StateObject var phh : navclass = navclass()
    
    var body: some View {
        NavigationStack(path: $phh.adc) {
            TabView(selection: $selectedTab) {
                ProfileView()
                    .tag(Tab.profile)
                
                HomeView(selectedTab: $selectedTab)
                    .tag(Tab.home)
                
                MatchesView()
                    .tag(Tab.matches)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            .navigationDestination(for: HomeViews.self) { hoem in
                switch hoem {
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
    }
}

struct BedrockNavView_Previews: PreviewProvider {
    static var previews: some View {
        BedrockNavView()
    }
}
