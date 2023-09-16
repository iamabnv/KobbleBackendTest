//
//  temp.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/7/23.
//

import SwiftUI

enum Tab1 {
    case home
    case profile
    case matches
}

struct temp: View {
    @State var selectedTab: Tab1 = .home
    
    var body: some View {
        
        NavigationStack {
            tabas()
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct temp_Previews: PreviewProvider {
    static var previews: some View {
        temp()
    }
}

struct tabas: View {
    @State var selectedTab: Tab1 = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("hello Profile")
                .tag(Tab1.profile)
            
            homeqwe()
                .tag(Tab1.home)
            
            Text("hello Matches")
                .tag(Tab1.matches)
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct homeqwe: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    CardView()
                }
            }
        }
    }
}
