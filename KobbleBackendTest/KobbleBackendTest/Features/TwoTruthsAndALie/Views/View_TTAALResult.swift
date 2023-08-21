//
//  View_TTAALResult.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/17/23.
//

import SwiftUI

struct VTTAALResult: View {
    @State private var txts: [String] = ["My name is Abhinav", "I am not scared of insects", "I am 20 years old"]
    
    @State var c1 = 0
    @State var c2 = 1
    @State var c3 = 2
    
    @ObservedObject var vm: VMTTAALRoot
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Spacer()
                .frame(height: 30)
            
            HStack(alignment: .center) {
                Text("\(vm.sesh?.currentContent?[c1].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(vm.sesh?.currentContent?[c1].isTrue == true ? .green : .red)
            }
            .padding(.vertical)
            
            HStack(alignment: .center) {
                Text("\(vm.sesh?.currentContent?[c2].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(vm.sesh?.currentContent?[c2].isTrue == true ? .green : .red)
            }
            .padding(.vertical)
            
            Divider()
                .padding(.horizontal)
                .padding(.bottom)
            
            Text("You chose:")
                .font(.system(size: 24))
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .foregroundColor(.orange)
            
            HStack(alignment: .center) {
                Text("\(vm.sesh?.currentContent?[c3].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(vm.sesh?.currentContent?[c3].isTrue == true ? .green : .red)
            }
            .padding(.vertical)
            
            Button {
                vm.updateFromResult()
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .background {
                        Circle()
                            .fill(.orange)
                    }
                
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.orange.opacity(0.15))
            
        }
        .padding()
        .onAppear {
            if vm.sesh?.currentAnswer == 0 {
                c1 = 1
                c2 = 2
                c3 = 0
            }
            else if vm.sesh?.currentAnswer == 1 {
                c1 = 0
                c2 = 2
                c3 = 1
            }
            else if vm.sesh?.currentAnswer == 2 {
                c1 = 0
                c2 = 1
                c3 = 2
            }
        }
    }
}

struct VTTAALResult_Previews: PreviewProvider {
    static var previews: some View {
        VTTAALResult(vm: VMTTAALRoot())
    }
}
