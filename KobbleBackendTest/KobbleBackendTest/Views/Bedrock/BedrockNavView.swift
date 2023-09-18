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
    //@StateObject var phh : navclass = navclass()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            View_Network_Profile()
                .navigationBarBackButtonHidden()
                .navigationBarHidden(true)
                .tag(Tab.profile)
            
            HomeView(selectedTab: $selectedTab)
                .navigationBarBackButtonHidden()
                .navigationBarHidden(true)
                .tag(Tab.home)
            
            MatchesView()
                .navigationBarBackButtonHidden()
                .navigationBarHidden(true)
                .tag(Tab.matches)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct BedrockNavView_Previews: PreviewProvider {
    static var previews: some View {
        BedrockNavView()
    }
}
