//
//  RootView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/13/23.
//

import SwiftUI

struct VRoot: View {
    
    @StateObject var navManager: CNavigationManager = CNavigationManager()
    
    var body: some View {
        NavigationStack(path: $navManager.navPath) {
            VTabbed()
                .ignoresSafeArea()
                .navigationDestination(for: ENavigationDestinations.self) { navView in
                    switch navView {
                    case .View_Home:
                        Text("Home")
                    case .View_Play:
                        Text("Play")
                    case .View_Matches:
                        Text("Matches")
                    case .View_Profile:
                        Text("Profile")
                    case .View_Search:
                        Text("Search")
                    case .View_Settings:
                        Text("Settings")
                    case .View_Social:
                        Text("Social")
                    case .View_Tabbed:
                        VTabbed()
                    }
                }
        }
        .environmentObject(navManager)
    }
}

struct VRoot_Previews: PreviewProvider {
    static var previews: some View {
        VRoot()
    }
}

struct VHome_TopBar: View {
    var body: some View {
        VStack {
            
            Spacer()
                .frame(height: 45)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                    
                }
            }
            .padding()
            .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .background(Color.pink)
        .offset(y: -15)
    }
}
