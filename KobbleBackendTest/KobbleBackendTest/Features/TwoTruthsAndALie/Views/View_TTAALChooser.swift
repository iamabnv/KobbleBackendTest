//
//  View_TTAALChooser.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/16/23.
//

import SwiftUI

struct VTTAALChooser: View {
    
    @State private var txts: [String] = ["My name is Abhinav", "I am not scared of insects", "I am 20 years old"]
    
    @State var sl = 0
    
    @ObservedObject var vm: VMTTAALRoot
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
                Button {
                    vm.randomChoices()
                } label: {
                    Image(systemName: "shuffle")
                        .foregroundColor(.orange)
                        .font(.title2)
                }
            }
            .padding()
            
            HStack(alignment: .center) {
                TextField("", text: $vm.currentChoices[0].choiceText)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.1)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(sl == 1 ? .white : .orange)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                if sl == 1 {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.orange)
                }
                else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.white))
                }
            }
            .padding(.vertical)
            .onTapGesture {
                print(sl)
                sl = 1
                print(sl)
            }
            
            HStack(alignment: .center) {
                TextField("", text: $vm.currentChoices[1].choiceText)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.1)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(sl == 2 ? .white : .orange)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                if sl == 2 {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.orange)
                }
                else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.white))
                }
                
            }
            .padding(.vertical)
            .onTapGesture {
                sl = 2
            }
            
            HStack(alignment: .center) {
                TextField("", text: $vm.currentChoices[2].choiceText)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.1)
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(sl == 3 ? .white : .orange)
            }
            .frame(maxWidth: .infinity, maxHeight: 75)
            .background {
                if sl == 3 {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.orange)
                }
                else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 1)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.white))
                }
                
            }
            .padding(.vertical)
            .onTapGesture {
                sl = 3
            }
            
            Button {
                
                if sl != 0 {
                    vm.currentChoices[sl - 1].isTrue = false
                    vm.updateFromChoosing()
                }
                
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
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.orange.opacity(0.15))
            
        }
        .padding()
        .onAppear {
            vm.randomChoices()
            //vm.updateCurrentChooser()
        }
    }
}

struct VTTAALChooser_Previews: PreviewProvider {
    static var previews: some View {
        VTTAALChooser(vm: VMTTAALRoot())
    }
}
