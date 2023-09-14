//
//  tempLevelView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 9/9/23.
//

import SwiftUI

struct tempLevelView: View {
    var body: some View {
        VStack {
            
            ProgressView("Trust: Level 5", value: 0.8)
                .padding()
            
            ProgressView("Love: Level 2", value: 0.4)
                .padding()
            
            ProgressView("Intimacy: Level 7", value: 0.6)
                .padding()
            
            ProgressView("Communication: Level 10", value: 0.1)
                .padding()
            
          
        }
    }
}

struct tempLevelView_Previews: PreviewProvider {
    static var previews: some View {
        tempLevelView()
    }
}
