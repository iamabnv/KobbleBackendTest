//
//  Model_UserSignUp.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 8/13/23.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseFirestoreCombineSwift

enum alcoholPreferenceTypes: String, Codable, CaseIterable {
    case nonDrinker = "Non drinker"
    case occasionalDrinker = "Occasional drinker"
    case socialDrinker = "Social drinker"
    case regularDrinker = "Regular drinker"
}

enum educationLevelTypes: String, Codable, CaseIterable {
    case noFormalEducation = "No formal education"
    case highSchool = "High school"
    case bachelors = "Bachelors"
    case masters = "Masters"
    case doctrate = "Doctrate"
}

enum exerciseHabitsTypes: String, Codable, CaseIterable {
    case lightlyActive = "Lightly active"
    case regularExerciser = "Regular exerciser"
    case fitnessEnthusiast = "Fitness enthusiast"
}

enum loveLanguageTypes: String, Codable, CaseIterable {
    case wordsOfAffirmation = "Words of affirmation"
    case actsOfService = "Acts of service"
    case receivingGifts = "Receiving gifts"
    case qualityTime = "Quality time"
    case physicalTouch = "Physical touch"
}

enum relationshipGoalTypes: String, Codable, CaseIterable {
    case marriage = "Marriage"
    case longTerm = "Long term commitment"
    case casualDating = "Casual dating"
    case activityPartner = "Activity partner"
}

enum religionTypes: String, Codable, CaseIterable {
    case christianity = "Christianity"
    case islam = "Islam"
    case hinduism = "Hinduism"
    case buddhism = "Buddhism"
    case sikhism = "Sikhism"
    case judaism = "Judaism"
    case jainism = "Jainism"
    case spiritual = "Spiritual"
    case notReligious = "Not religious"
    case other = "Other"
}

enum smokingPreferenceTypes: String, Codable, CaseIterable {
    case nonSmoker = "Non smoker"
    case occasionalSmoker = "Occasional smoker"
    case regularSmoker = "Regular smoker"
    case socialSmoker = "Social smoker"
}

public struct MUserSignUp: Codable {
    @DocumentID var id: String?
    var alcoholPreference: alcoholPreferenceTypes?
    var firstName: String
    var phoneNumber: String
    var location: GeoPoint?
    var gender: String?
    var desiredGender: String?
    var age: Int?
    var desiredAge: Int?
    var desiredHeight: Double?
    var desiredMaxAge: Int
    var desiredMinAge: Int
    var educationLevel: educationLevelTypes?
    var exerciseLevel: exerciseHabitsTypes?
    var height: Double?
    var loveLanguage: loveLanguageTypes?
    var relationshipGoal: relationshipGoalTypes?
    var religion: religionTypes?
    var smokingPreference: smokingPreferenceTypes?
    var traits: [Trait]?
    var desiredTraits: [Trait]?
}

public var userSignUpVar = MUserSignUp(firstName: "", phoneNumber: "", desiredMaxAge: 65, desiredMinAge: 18)
