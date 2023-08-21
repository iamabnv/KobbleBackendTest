//
//  Class_TTAALRootVM.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/18/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine
import FirebaseFirestoreCombineSwift

class VMTTAALRoot: ObservableObject {
    
    let playerid = "player2"

    @Published var sesh: STTAALGameSession?
    
    let choicesChoices = ["I secretly love binge-watching cheesy romantic comedies", "I believed in unicorns", "I secretly watch reality TV", "I avoid rollercoasters", "I have missed a flight", "I can recite the entire alphabet backwards", "I used to believe my toys used to have secret lives", "I used to pretend I was a princess", "I've called my teacher 'mom' in class"]
    
    @Published var currentChoices: [STTAALChoices] = [STTAALChoices(choiceText: "", isTrue: true, owner: "player1"), STTAALChoices(choiceText: "", isTrue: true, owner: "player1"), STTAALChoices(choiceText: "", isTrue: true, owner: "player1")]
    
    let db = Firestore.firestore()
    
    let gameSeshID = "xEjcjw0YR9hBJdjXvJdg"
    
    private var listener: ListenerRegistration?
    
    init() {
        startListening()
    }
    
    func startListening() {
        let docRef = db.collection("gameSessions").document("\(gameSeshID)")
        
        listener = docRef.addSnapshotListener { (documentSnapshot, error) in
            if let error = error {
                print("Error fetching document: \(error)")
                return
            }
            
            self.sesh = try? documentSnapshot?.data(as: STTAALGameSession.self)
        }
    }
    
    deinit {
        listener?.remove()  // Stop listening to changes when this object is deallocated.
    }
    
    func addGameSessionToFirestore(completion: @escaping (Error?) -> Void) {
        do {
            _ = try db.collection("gameSessions").addDocument(from: STTAALGameSession(player1ID: "player1", player2ID: "player2", gameType: .TTAAL, timeCreated: Timestamp(), sessionOwner: "player1", sessionStatus: .inProgress, player1Stage: .choosing, player2Stage: .waitingBeforeFinder, currentRound: 1, totalRounds: 4, player1CorrectAnswers: 0, player2CorrectAnswers: 0, prevPlayer1State: "choosing", prevPlayer2State: "finder")) { error in
                completion(error)
            }
        } catch let error {
            completion(error)
        }
    }
    
    func randomChoices() {
        let a = self.choicesChoices.shuffled()
        for i in 0...2 {
            self.currentChoices[i].choiceText = a[i]
            self.currentChoices[i].isTrue = true
        }
    }
    
    func updateFromChoosing() {
        guard var sesh = sesh else { return }
        sesh.currentContent = currentChoices
        if sesh.player1Stage == .choosing {
            sesh.player1Stage = .waitingAfterChoosing
        }
        else {
            sesh.player1Stage = .finder
        }
        
        if sesh.player2Stage == .choosing {
            sesh.player2Stage = .waitingAfterChoosing
        }
        else {
            sesh.player2Stage = .finder
        }
        
        do {
            let seshData = try Firestore.Encoder().encode(sesh)
            db.collection("gameSessions").document(gameSeshID).updateData(seshData) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                }
            }
        } catch let error {
            print("Error encoding sesh: \(error)")
        }
    }
    
    func updateFromFinding(answer: Int) {
        guard var sesh = sesh else { return }
        sesh.currentAnswer = answer
        sesh.player1Stage = .result
        sesh.player2Stage = .result
        
        do {
            let seshData = try Firestore.Encoder().encode(sesh)
            db.collection("gameSessions").document(gameSeshID).updateData(seshData) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated")
                }
            }
        } catch let error {
            print("Error encoding sesh: \(error)")
        }
    }
    
    func updateFromResult() {
        
        if playerid == sesh?.player1ID {
            if sesh?.prevPlayer1State == "choosing" {
                sesh?.player1Stage = .waitingBeforeFinder
                sesh?.prevPlayer1State = "finder"
            }
            else {
                sesh?.player1Stage = .choosing
                sesh?.prevPlayer1State = "choosing"
            }
            
            db.collection("gameSessions").document(gameSeshID).updateData(["player1Stage" : sesh?.player1Stage?.rawValue ?? "choosing", "prevPlayer1State": sesh?.prevPlayer1State ?? "choosing"]) {err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        else {
            if sesh?.prevPlayer2State == "choosing" {
                sesh?.player2Stage = .waitingBeforeFinder
                sesh?.prevPlayer2State = "finder"
            }
            else {
                sesh?.player2Stage = .choosing
                sesh?.prevPlayer2State = "choosing"
            }
            
            db.collection("gameSessions").document(gameSeshID).updateData(["player2Stage" : sesh?.player2Stage?.rawValue ?? "choosing", "prevPlayer2State": sesh?.prevPlayer2State ?? "choosing"]) {err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        
        
    }
    
}
