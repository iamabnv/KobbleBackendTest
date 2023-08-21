//
//  View_TTAALFinder.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/16/23.
//

import SwiftUI

enum focs: Hashable {
    case txtView
    case sheetView
}

struct VTTAALFinder: View {
    
    @State private var txts: [String] = ["My name is Abhinav", "I am not scared of insects", "I am 20 years old"]
    
    @State var sl = 0
    
    @ObservedObject var vm: VMTTAALRoot
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Spacer()
                .frame(height: 60)
            
            HStack(alignment: .center) {
                Text("\(vm.sesh?.currentContent?[0].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
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
                Text("\(vm.sesh?.currentContent?[1].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
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
                Text("\(vm.sesh?.currentContent?[2].choiceText ?? "hello")")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
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
                    vm.updateFromFinding(answer: sl - 1)
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
            
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(Color.orange.opacity(0.15))
            
        }
        .padding()
    }
}

struct sheetTry: View {
    
    @State var s: String = ""
    
    @FocusState var sdd: focs?
    
    var body: some View {
        VStack {
            TextField("Send mesage", text: $s)
                .focused($sdd, equals: .sheetView)
        }
        .onAppear {
            sdd = .sheetView
        }
    }
}

struct VTTAALFinder_Previews: PreviewProvider {
    static var previews: some View {
        VTTAALFinder(vm: VMTTAALRoot())
    }
}
