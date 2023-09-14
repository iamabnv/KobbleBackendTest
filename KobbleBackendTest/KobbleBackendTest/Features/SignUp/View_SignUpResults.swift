//
//  View_SignUpResults.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/15/23.
//

import SwiftUI

struct View_SignUpResults: View {
    
    let traits = ["Interaction Style", "Cognitive Approach", "Value System", "Organizational Preference", "Emotional Response", "Collaborative Nature"]
    
    @State var showTraitSheet: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                Spacer()
                    .frame(height: 12)
                
                Text("Your results")
                    .font(.system(size: 42))
                    .fontDesign(.rounded)
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .padding()
                
                Text("Based on your answers and our algorithm, these are your traits and qualities. For now*.")
                    .foregroundColor(.secondary)
                    .font(.system(size: 14))
                    .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Traits")
                        .font(.system(size: 28))
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                        .foregroundColor(.accentColor)
                    
                    ForEach(1..<7, id: \.self) {ind in
                        ProgressView(value: Float(ind) / 10.0) {
                            Text("\(traits[ind - 1])")
                                .font(.system(size: 14))
                                .fontDesign(.rounded)
                                .fontWeight(.semibold)
                                .foregroundColor(.accentColor)
                        }
                        .padding(.vertical)
                        .padding(.trailing)
                        .onTapGesture {
                            print("\(traits[ind - 1]) tapped")
                            showTraitSheet = true
                        }
                    }
                    
                    Text("Tap any trait to learn more about it.")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
                .padding()
                .padding(.top)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .sheet(isPresented: $showTraitSheet) {
                VTraitExplanationSheet()
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
        }
    }
}

struct View_SignUpResults_Previews: PreviewProvider {
    static var previews: some View {
        View_SignUpResults()
    }
}

struct VTraitExplanationSheet: View {
    var body: some View {
        ProgressView(value: 0.7) {
            HStack {
                Text("1")
                Spacer()
                Text("2")
                Spacer()
                Text("3")
                Spacer()
                Text("4")
            }
        }
    }
}
