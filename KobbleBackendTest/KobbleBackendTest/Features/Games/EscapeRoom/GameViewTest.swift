//
//  GameViewTest.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/30/23.
//

import SwiftUI

struct Game {
    var stages: [CrypticHunt]
    var currentStageIndex = 0
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if stages[currentStageIndex].answer.lowercased() == answer.lowercased() {
            if currentStageIndex < stages.count - 1 {
                currentStageIndex += 1
            }
            return true
        } else {
            return false
        }
    }
    
    var isFinished: Bool {
        currentStageIndex == stages.count - 1
    }
}

struct GameView: View {
    @State var game: Game
    @State private var userAnswer = ""
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Game: \(game.stages[game.currentStageIndex].gameTitle)")
                    .font(.largeTitle)
                    .padding()
                
                Text("Stage \(game.stages[game.currentStageIndex].stageNumber)")
                    .font(.title)
                    .padding()
                
                Text(game.stages[game.currentStageIndex].stage)
                    .font(.body)
                    .padding()
                
                TextField("Your answer", text: $userAnswer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer()
                
                Button(action: {
                    if game.checkAnswer(userAnswer) {
                        userAnswer = ""
                    } else {
                        showAlert = true
                    }
                }) {
                    Text(game.isFinished ? "Finish" : "Next")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Wrong Answer"), message: Text("Please try again."), dismissButton: .default(Text("OK")))
                }
            }
            
            if game.isFinished {
                VStack {
                    Text("Congratulations!")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("You've completed the game!")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        // Reset the game
                        game = Game(stages: game.stages)
                    }) {
                        Text("Play Again")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.8))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
