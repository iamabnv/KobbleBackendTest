//
//  View_Home_Root.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/24/23.
//

import SwiftUI

struct VHome_Root: View {
    
    @Binding var selectedTab: ENavigationDestinations
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer()
                    .frame(height: 125)
                ForEach(1...15, id: \.self) {_ in
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .onTapGesture {
                            print("hffdfs")
                            selectedTab = .View_Profile
                        }
                }
                .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .overlay (alignment: .top) {
            VHome_TopBar()
        }
    }
}

struct VHome_Root_Previews: PreviewProvider {
    static var previews: some View {
        VHome_Root(selectedTab: Binding<ENavigationDestinations>.constant(.View_Home))
    }
}


