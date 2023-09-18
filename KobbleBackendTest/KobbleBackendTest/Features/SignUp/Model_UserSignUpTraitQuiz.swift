//
//  Model_UserSignUpTraitQuiz.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/14/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseFunctions

struct Question: Codable {
    let id: Int
    let text: String
    let choices: [Choice]
}

struct Choice: Codable, Equatable {
    let text: String
    let traits: [String: Int]
}

struct QuestionSet: Codable {
    let setid: Int
    let questions: [Question]
}

struct QuestionSetsWrapper: Codable {
    let questionsets: [QuestionSet]
}

struct Trait: Codable, Hashable {
    var name: String?
    var rating: Double?
}

struct CompatibilityMatrix {
    let matrix: [Trait: [Trait: Double]]
}

struct UserScores {
    let scores: [Trait: Double]
}

class das {
    
    let db = Firestore.firestore()
    
    func addGameSessionToFirestore(completion: @escaping (Error?, String?) -> Void) {
        // Generate a new document ID
        let documentId = db.collection("userDetails").document().documentID
        
        do {
            try db.collection("userDetails").document(documentId).setData(from: userSignUpVar) { error in
                if let error = error {
                    completion(error, nil)
                    return
                }
                
                // If we reach this point, it means the document was successfully added
                // Pass the document ID back in the completion handler
                completion(nil, documentId)
            }
            
        } catch let error {
            completion(error, nil)
        }
    }

    
    
    let adventurousness = Trait(name: "Adventurousness")
    let analytical = Trait(name: "Analytical")
    let empathy = Trait(name: "Empathy")
    let assertiveness = Trait(name: "Assertiveness")
    let creativity = Trait(name: "Creativity")
    let discipline = Trait(name: "Discipline")
    let charisma = Trait(name: "Charisma")
    let pragmatism = Trait(name: "Pragmatism")
    let altruism = Trait(name: "Altruism")
    let ambition = Trait(name: "Ambition")
    let introspection = Trait(name: "Introspection")
    let spontaneity = Trait(name: "Spontaneity")
    
    let userAnswers: [[String: Any]] = [
        ["setid": 0, "questionid": 0, "choice": "Laugh it off and join the dance floor with your new 'design'.", "choicenumber": 0, "traits": ["Adventurousness": 2, "Charisma": 1]],
        ["setid": 0, "questionid": 1, "choice": "Plan a systematic approach to find the owner using the ID.", "choicenumber": 1, "traits": ["Pragmatism": 2, "Discipline": 1]]
        // ... other answers
    ]
    
    public var compatibilityMatrix: CompatibilityMatrix?
    
    var rands: QuestionSet?
    
    var curSetIdx: Int?
    
    init() {
        
        rands = das.getRandomQuestionSet(fromFile: "questionSets")
        
        if let randomSet = das.getRandomQuestionSet(fromFile: "questionSets") {
            //print("-------------------------------- RANDOM SET ----------------------------")
            //print(randomSet)
        }
        
        compatibilityMatrix = CompatibilityMatrix(matrix: [
            adventurousness: [adventurousness: 1, analytical: 0.4, empathy: 1, assertiveness: 0.8, creativity: 1, discipline: 0.2, charisma: 1, pragmatism: 0.4, altruism: 0.8, ambition: 0.6, introspection: 0.6, spontaneity: 1],
            analytical: [adventurousness: 0.6, analytical: 1, empathy: 0.6, assertiveness: 1, creativity: 0.4, discipline: 1, charisma: 0.4, pragmatism: 1, altruism: 0.4, ambition: 0.8, introspection: 1, spontaneity: 0.2],
            empathy: [adventurousness: 0.8, analytical: 0.4, empathy: 1, assertiveness: 0.6, creativity: 0.8, discipline: 0.6, charisma: 1, pragmatism: 0.4, altruism: 1, ambition: 0.4, introspection: 1, spontaneity: 0.8],
            assertiveness: [adventurousness: 0.8, analytical: 0.8, empathy: 0.4, assertiveness: 1, creativity: 0.8, discipline: 0.8, charisma: 1, pragmatism: 1, altruism: 0.2, ambition: 1, introspection: 0.6, spontaneity: 0.8],
            creativity: [adventurousness: 1, analytical: 0.6, empathy: 1, assertiveness: 0.6, creativity: 1, discipline: 0.4, charisma: 1, pragmatism: 0.4, altruism: 1, ambition: 0.6, introspection: 1, spontaneity: 1],
            discipline: [adventurousness: 0.4, analytical: 1, empathy: 0.6, assertiveness: 1, creativity: 0.4, discipline: 1, charisma: 0.6, pragmatism: 1, altruism: 0.6, ambition: 1, introspection: 0.8, spontaneity: 0.2],
            charisma: [adventurousness: 1, analytical: 0.6, empathy: 1, assertiveness: 1, creativity: 1, discipline: 0.6, charisma: 1, pragmatism: 0.8, altruism: 1, ambition: 0.8, introspection: 0.8, spontaneity: 1],
            pragmatism: [adventurousness: 0.6, analytical: 1, empathy: 0.6, assertiveness: 1, creativity: 0.6, discipline: 1, charisma: 0.8, pragmatism: 1, altruism: 0.6, ambition: 1, introspection: 0.8, spontaneity: 0.4],
            altruism: [adventurousness: 0.8, analytical: 0.6, empathy: 1, assertiveness: 0.4, creativity: 1, discipline: 0.8, charisma: 1, pragmatism: 0.6, altruism: 1, ambition: 0.6, introspection: 1, spontaneity: 0.8],
            ambition: [adventurousness: 0.8, analytical: 1, empathy: 0.4, assertiveness: 1, creativity: 0.8, discipline: 1, charisma: 1, pragmatism: 1, altruism: 0.4, ambition: 1, introspection: 0.6, spontaneity: 0.6],
            introspection: [adventurousness: 0.8, analytical: 1, empathy: 1, assertiveness: 0.6, creativity: 1, discipline: 1, charisma: 0.8, pragmatism: 1, altruism: 1, ambition: 0.8, introspection: 1, spontaneity: 0.8],
            spontaneity: [adventurousness: 1, analytical: 0.4, empathy: 1, assertiveness: 0.8, creativity: 1, discipline: 0.4, charisma: 1, pragmatism: 0.4, altruism: 0.8, ambition: 0.6, introspection: 0.8, spontaneity: 0.8]
        ])
        
        let traitRatings = das.calculateTraitRatings(userAnswers: userAnswers)
        //print("-------------------------------- MY TRAITS ----------------------------")
        //print(traitRatings)
        
        let desiredPartnerTraits = das.computeDesiredPartnerTraits(userScores: traitRatings, compatibilityMatrix: compatibilityMatrix!)
        //print("-------------------------------- DESIRED PARTNER TRAITS ----------------------------")
        //print(desiredPartnerTraits)
    }
    
    //let traitRatings = das.calculateTraitRatings(userAnswers: userAnswers)
    //print(traitRatings)
    
    //let desiredPartnerTraits = das.computeDesiredPartnerTraits(userScores: traitRatings, compatibilityMatrix: compatibilityMatrix)
    //print(desiredPartnerTraits)
    
    
    
    public static func getRandomQuestionSet(fromFile filename: String) -> QuestionSet? {
        // Get the file URL
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("File not found!")
            return nil
        }
        
        do {
            // Read the data from the file
            let data = try Data(contentsOf: fileURL)
            
            // Decode the data into a QuestionSetsWrapper
            let decoder = JSONDecoder()
            let wrapper = try decoder.decode(QuestionSetsWrapper.self, from: data)
            
            // Pick a random QuestionSet and return
            let randomIndex = Int.random(in: 0..<wrapper.questionsets.count)
            return wrapper.questionsets[randomIndex]
            
        } catch {
            print("Error reading or decoding file: \(error)")
            return nil
        }
    }
    
    // Example usage:
    
    
    public static func calculateTraitRatings(userAnswers: [[String: Any]]) -> [Trait] {
        // Initialize a dictionary to store the total score for each trait
        var totalTraitScores: [String: Int] = [
            "Adventurousness": 0, "Analytical": 0, "Empathy": 0, "Assertiveness": 0,
            "Creativity": 0, "Discipline": 0, "Charisma": 0, "Pragmatism": 0,
            "Altruism": 0, "Ambition": 0, "Introspection": 0, "Spontaneity": 0
        ]
        
        // Process each answer
        for answer in userAnswers {
            if let traits = answer["traits"] as? [String: Int] {
                for (trait, score) in traits {
                    totalTraitScores[trait, default: 0] += score
                }
            }
        }
        
        // Find the maximum score
        let maxScore = totalTraitScores.values.max() ?? 1
        
        // Normalize the scores to be between 0 and 1
        let normalizedScores = totalTraitScores.mapValues { Double($0) / Double(maxScore) }
        
        // Convert the scores to an array of dictionaries and sort in descending order of rating
        let sortedScores = normalizedScores.sorted { $0.value > $1.value }
        let result = sortedScores.map { Trait(name: $0.key, rating: $0.value) }
        
        return result
    }
    
    
    
    typealias UserScore = Trait
    typealias UserScores = [UserScore]
    
    public static func computeDesiredPartnerTraits(userScores: UserScores, compatibilityMatrix: CompatibilityMatrix) -> UserScores {
        var desiredRatings: [String: Double] = [:]
        
        // Convert UserScores to a more usable format
        var userScoresDict: [String: Double] = [:]
        for score in userScores {
            if let trait = score.name, let rating = score.rating {
                userScoresDict[trait] = rating
            }
        }
        
        for (trait, compatibilities) in compatibilityMatrix.matrix {
            var rating: Double = 0.0
            for (relatedTrait, compatibilityScore) in compatibilities {
                if let userScore = userScoresDict[relatedTrait.name!] {
                    rating += compatibilityScore * userScore
                }
            }
            desiredRatings[trait.name!] = rating
        }
        
        // Normalize the ratings
        if let minRating = desiredRatings.values.min(), let maxRating = desiredRatings.values.max() {
            let range = maxRating - minRating
            for (trait, rating) in desiredRatings {
                desiredRatings[trait] = (rating - minRating) / range
            }
        }
        
        // Convert to the desired output format
        var output: UserScores = []
        for (trait, rating) in desiredRatings {
            output.append(Trait(name: trait, rating: rating))
        }
        
        // Sort the output by rating in ascending order
        output.sort { ($0.rating ?? 0.0) > ($1.rating ?? 0.0) }
        
        return output
    }
}
