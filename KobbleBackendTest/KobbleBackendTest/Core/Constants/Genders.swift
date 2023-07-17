//
//  Genders.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/16/23.
//

import Foundation

enum Gender: String, Codable, Hashable {
    case male = "Male"
    case female = "Female"
    case nonBinary = "Non-binary"
    case transgenderMale = "Transgender Male"
    case transgenderFemale = "Transgender Female"
    case genderqueer = "Genderqueer"
    case agender = "Agender"
    case bigender = "Bigender"
    // Add more genders as needed
    
    static var allGenders: [Gender] {
        return [
            .male,
            .female,
            .nonBinary,
            .transgenderMale,
            .transgenderFemale,
            .genderqueer,
            .agender,
            .bigender
            // Add more genders as needed
        ]
    }
}
