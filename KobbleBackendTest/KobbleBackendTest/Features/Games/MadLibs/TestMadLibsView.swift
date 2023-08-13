//
//  TestMadLibsView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/31/23.
//

import SwiftUI

struct MadLibs: Codable {
    let theme: String
    let story: [StoryPart]
}

struct StoryPart: Codable {
    let text: String?
    let blank: Blank?
}

struct Blank: Codable {
    let type: String
}

struct TestMadLibsView: View {
    @State private var madLibs: MadLibs? = nil
    @State private var userInputs: [String] = []
    @State private var currentIndex: Int = 0
    @State private var showStory: Bool = false
    
    var body: some View {
        VStack {
            if showStory {
                ScrollView {
                    Text(completeStory())
                        .font(.title)
                        .padding()
                }
            } else {
                if let madLibs = madLibs, currentIndex < madLibs.story.count {
                    if madLibs.story[currentIndex].blank != nil {
                        TextField("Enter a \(madLibs.story[currentIndex].blank!.type)...", text: $userInputs[currentIndex])
                            .font(.title)
                            .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Button(action: {
                        currentIndex += 1
                        if currentIndex >= madLibs.story.count {
                            showStory = true
                        }
                    }) {
                        Text("Next")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .onAppear {
            madLibs = loadMadLibs()
            userInputs = Array(repeating: "", count: madLibs?.story.count ?? 0)
        }
    }
    
    func loadMadLibs() -> MadLibs? {
        if let url = Bundle.main.url(forResource: "madlibs", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let madLibs = try decoder.decode(MadLibs.self, from: data)
                print(madLibs)
                return madLibs
            } catch {
                print("Error loading Mad Libs: \(error)")
            }
        }
        return nil
    }
    
    func completeStory() -> String {
        var story = ""
        for i in 0..<userInputs.count {
            if let text = madLibs?.story[i].text {
                story += text
            }
            if madLibs?.story[i].blank != nil {
                story += userInputs[i]
            }
        }
        return story
    }
}

struct TestMadLibsView_Previews: PreviewProvider {
    static var previews: some View {
        TestMadLibsView()
    }
}
