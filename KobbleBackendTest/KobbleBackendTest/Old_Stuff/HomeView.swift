//
//  HomeView.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 6/20/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFunctions
import FirebaseFunctionsCombineSwift
import FirebaseFirestoreSwift

struct Player: Codable {
    @DocumentID var id: String?
    var playerId: String
    var timeAdded: Timestamp
    var selectedTrait: String
    var isPaired: Bool
}

struct PlayerInformation: Codable {
    var playerId: String
    var selectedTrait: String
}

class GameViewModel: ObservableObject {
    private let db = Firestore.firestore()
    
    init() {
        
    }
    
    func callCloudFunction(with playerInfo: PlayerInformation) {
        let functions = Functions.functions()
        
        functions.httpsCallable("createOrJoinGameSession").call(["playerId" : playerInfo.playerId, "selectedTrait" : playerInfo.selectedTrait]) { (result, error) in
            if let error = error as NSError? {
                print("Error calling cloud function: \(error)")
                return
            }
            
            if let sessionId = (result?.data as? String) {
                print("Game session ID: \(sessionId)")
                // Handle the game session ID as needed
            }
        }
    }
    
    func addPlayerToCollection(pId: String, trait: String) {
        let player = Player(
            playerId: pId,
            timeAdded: Timestamp(date: Date()),
            selectedTrait: trait,
            isPaired: false
        )
        
        do {
            _ = try db.collection("queues/game_cyoa_global/queue").addDocument(from: player) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added successfully.")
                }
            }
        } catch {
            print("Error encoding document: \(error)")
        }
    }
}

enum Traits: String {
    case leadership = "Leadership by example"
    case thinker = "Innovative thinker"
}

enum Players: String {
    case player1 = "Player1"
    case player2 = "Player2"
}

struct HomeView: View {
    
    @State private var selectedTrait: Traits = .leadership
    
    @State private var selectedPlayer: Players = .player1
    
    @StateObject var viewVM: GameViewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 32) {
            
            HStack(spacing: 64) {
                
                Button {
                    withAnimation {
                        selectedPlayer = .player1
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(selectedPlayer == .player1 ? .blue : .white)
                            .overlay(
                                Circle()
                                    .stroke(selectedPlayer == .player1 ? Color.white : Color.blue, lineWidth: 2)
                            )
                            .frame(width: 64, height: 64)
                        
                        Image(systemName: selectedPlayer == .player1 ? "person.fill" : "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedPlayer == .player1 ? .white : .blue)
                            .frame(width: 32, height: 32)
                    }
                }
                
                Button {
                    withAnimation {
                        selectedPlayer = .player2
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(selectedPlayer == .player1 ? .white : .blue)
                            .overlay(
                                Circle()
                                    .stroke(selectedPlayer == .player1 ? Color.blue : Color.white, lineWidth: 2)
                            )
                            .frame(width: 64, height: 64)
                        
                        Image(systemName: selectedPlayer == .player1 ? "person.2" : "person.2.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedPlayer == .player1 ? .blue : .white)
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .padding(.bottom, 32)
            
            Text("Current trait:")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
            
            Text(selectedTrait.rawValue)
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.rounded)
                .padding(.top, -16)
            
            HStack(spacing: 64) {
                
                Button {
                    withAnimation {
                        selectedTrait = .leadership
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(selectedTrait == .leadership ? .blue : .white)
                            .overlay(
                                Circle()
                                    .stroke(selectedTrait == .leadership ? Color.white : Color.blue, lineWidth: 2)
                            )
                            .frame(width: 64, height: 64)
                        
                        Image(systemName: selectedTrait == .leadership ? "person.3.fill" : "person.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedTrait == .leadership ? .white : .blue)
                            .frame(width: 32, height: 32)
                    }
                }
                
                Button {
                    withAnimation {
                        selectedTrait = .thinker
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(selectedTrait == .leadership ? .white : .blue)
                            .overlay(
                                Circle()
                                    .stroke(selectedTrait == .leadership ? Color.blue : Color.white, lineWidth: 2)
                            )
                            .frame(width: 64, height: 64)
                        
                        Image(systemName: selectedTrait == .leadership ? "lightbulb" : "lightbulb.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedTrait == .leadership ? .blue : .white)
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .padding(.bottom, 32)
            
            Button(action: {
                let a = PlayerInformation(playerId: selectedPlayer.rawValue, selectedTrait: selectedTrait.rawValue)
                viewVM.callCloudFunction(with: a)
                //viewVM.addPlayerToCollection(pId: selectedPlayer.rawValue, trait: selectedTrait.rawValue)
            }) {
                Label("Play", systemImage: "play.fill")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
