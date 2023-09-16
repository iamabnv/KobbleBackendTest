//
//  View_Tabbed.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/13/23.
//

import SwiftUI

struct VTabbed: View {
    
    @State var selectedTab: ENavigationDestinations = .View_Home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Profile")
                .tag(ENavigationDestinations.View_Profile)
            
            VHome_Root(selectedTab: $selectedTab)
                .tag(ENavigationDestinations.View_Home)
            
            Text("Matches")
                .tag(ENavigationDestinations.View_Matches)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct VTabbed_Previews: PreviewProvider {
    static var previews: some View {
        VTabbed()
    }
}
