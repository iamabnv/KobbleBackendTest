//
//  View_TTAALWaiting.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/17/23.
//

import SwiftUI

struct VTTAALWaiting: View {
    
    var waitMessage: String = "Waiting for your match's response"
    
    @ObservedObject var vm: VMTTAALRoot
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("\(waitMessage)")
                .font(.system(size: 32))
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.orange.opacity(0.15))
            
        }
        .padding()
        .onAppear {
            //vm.updateFromWaiting()
        }
    }
}

struct VTTAALWaiting_Previews: PreviewProvider {
    static var previews: some View {
        VTTAALWaiting(vm: VMTTAALRoot())
    }
}
