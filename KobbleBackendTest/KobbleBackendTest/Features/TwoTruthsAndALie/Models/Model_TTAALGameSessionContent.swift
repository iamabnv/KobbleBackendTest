//
//  Struct_TTAALGameSessionContent.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/18/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum ETTAALViewState: String, Codable {
    case result
    case choosing
    case finder
    case waitingAfterChoosing
    case waitingBeforeFinder
}

struct STTAALChoices: Codable {
    var choiceText: String
    var isTrue: Bool
    var owner: String
}

struct STTAALGameSession: Codable {
    @DocumentID var id: String?
    var player1ID: String
    var player2ID: String
    var gameType: EGameTypes
    var timeCreated: Timestamp
    var sessionOwner: String
    var sessionStatus: ESessionStatus
    
    var player1Stage: ETTAALViewState?
    var player2Stage: ETTAALViewState?
    var currentRound: Int?
    let totalRounds: Int?
    var currentContent: [STTAALChoices]?
    var player1CorrectAnswers: Int?
    var player2CorrectAnswers: Int?
    var currentAnswer: Int?
    var prevPlayer1State: String?
    var prevPlayer2State: String?
}
