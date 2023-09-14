//
//  Class_NavigationManager.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/13/23.
//

import Foundation

class CNavigationManager: ObservableObject {
    @Published var navPath: [ENavigationDestinations] = []
}
