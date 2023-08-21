//
//  Class_GameSessionManager.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/18/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum ESessionStatus: String, Codable {
    case pending
    case inProgress
    case finished
}

class CGameSessionContent: Codable {}

struct GameSession: Codable {
    @DocumentID var id: String?
    var player1ID: String
    var player2ID: String
    var gameType: EGameTypes
    var timeCreated: Timestamp
    var sessionOwner: String
    var sessionStatus: ESessionStatus
    
    var gameContent: CGameSessionContent
}
