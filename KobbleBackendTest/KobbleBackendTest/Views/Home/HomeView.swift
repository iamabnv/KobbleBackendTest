//
//  HomeView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/7/23.
//

import SwiftUI

enum HomeViews: Codable {
case SocialView
case SearchView
case PlayView
case RequestsView
case SettingsView
case BedRockNavView
}

struct HomeView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<20) { _ in
                    CardView()
                }
            }
            .padding()
            .padding(.top, 120)
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(alignment: .top) {
            TopBarView2(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .offset(y: 0)
        }
        .overlay(alignment: .bottom) {
            BottomBarView()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .offset(y: 0)
        }
    }
}

/**
 
 .overlay(alignment: .top) {
 TopBarView2(selectedTab: $selectedTab)
 .frame(width: geometry.size.width)
 .background(Color.black)
 .offset(y: 0)
 }
 .overlay(alignment: .bottom) {
 BottomBarView()
 .frame(width: geometry.size.width)
 .background(Color.black)
 .offset(y: 0)
 }
 
 **/

struct CardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.accentColor)
            .frame(height: 200)
            .cornerRadius(10)
    }
}

struct pewpewView: View {
    
    var txt: String
    @EnvironmentObject var phh : navclass
    
    var body: some View {
        VStack {
            Button {
                phh.adc.popLast()
            } label: {
                Text("lpd")
            }
        }
    }
}


struct TopBarView2: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            HStack () {
                Image("koba")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 8)
            }
            
        }
        .frame(maxHeight: 105)
    }
}

struct TopBarView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            HStack (spacing: 16) {
                Button(action: {
                    withAnimation {
                        selectedTab = .profile
                    }
                }) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Button(action: {
                    withAnimation {
                        selectedTab = .matches
                    }
                }) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding(.leading)
            }
            .padding()
        }
        .frame(height: 100)
    }
}

struct BottomBarView: View {
    
    @EnvironmentObject var phh : navclass
    
    var body: some View {
        VStack {
            HStack (spacing: 16) {
                Button(action: {
                }) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .padding(.leading)
                Spacer()
                NavigationLink {
                    pewpewView(txt: "pepewpew")
                } label: {
                    Image(systemName: "square.and.arrow.up.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }

                Spacer()
                Button(action: {
                    
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                Spacer()
                Button(action: {
                    phh.adc.append(.PlayView)
                }) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    phh.adc.append(.RequestsView)
                }) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                Spacer()
            }
            .padding()
            
            Spacer()
                .frame(height: 40)
        }
    }
}


/**
 
 NavigationStack (path: $navPath) {
 }
 .navigationDestination(for: HomeViews.self) { homev in
 switch homev {
 case .SocialView:
 pewpewView(txt: "Social View", pth: $navPath)
 .navigationBarBackButtonHidden()
 case .SearchView:
 pewpewView(txt: "Search View", pth: $navPath)
 .navigationBarBackButtonHidden()
 case .PlayView:
 pewpewView(txt: "Play View", pth: $navPath)
 .navigationBarBackButtonHidden()
 case .RequestsView:
 pewpewView(txt: "Requests View", pth: $navPath)
 .navigationBarBackButtonHidden()
 case .SettingsView:
 pewpewView(txt: "Settings View", pth: $navPath)
 .navigationBarBackButtonHidden()
 }
 }
 **/
