//
//  View_TTAALRoot.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/17/23.
//

import SwiftUI



struct VTTAALRoot: View {
    
    var currentViewState: ETTAALViewState = .result
    
    @StateObject var vm: VMTTAALRoot = VMTTAALRoot()
    
    @State var title: String = "Choose the lie!"
    @State var message: String = "Click shuffle to get new choices, or click to edit choices"
    
    var body: some View {
        VStack(alignment: .leading) {
            VTTAALChooserTopBar(title: $title, message: $message)
            
            
            switch (vm.playerid == vm.sesh?.player1ID ? vm.sesh?.player1Stage : vm.sesh?.player2Stage) {
            case .waitingAfterChoosing:
                VTTAALWaiting(vm: vm)
            case .choosing:
                VTTAALChooser(vm: vm)
            case .finder:
                VTTAALFinder(vm: vm)
            case .waitingBeforeFinder:
                VTTAALWaiting(waitMessage: "Waiting for your match to choose", vm: vm)
            case .result:
                VTTAALResult(vm: vm)
                
            case .none:
                EmptyView()
            }
            
            
            
            VTTAALChooserBottomBar()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.white)
        .ignoresSafeArea(.keyboard)
    }
}

struct VTTAALChooserTopBar: View {
    
    @Binding var title: String
    @Binding var message: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
                .frame(height: 8)
            HStack {
                Text("\(title)")
                    .font(.system(size: 32))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                Spacer()
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("\(message)")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14))
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}

struct VTTAALChooserBottomBar: View {
    
    @State var txt: String = "Send message"
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: $txt)
                    .disabled(true)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, maxHeight: 35)
                    .padding(.horizontal)
                    .background {
                        RoundedRectangle(cornerRadius: 18)
                            .foregroundColor(.white)
                            .shadow(radius: 2)
                    }
                    .onTapGesture {
                        print("heloo")
                    }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .padding(.top)
        .frame(maxWidth: .infinity)
    }
}


struct VTTAALRoot_Previews: PreviewProvider {
    static var previews: some View {
        VTTAALRoot()
    }
}
