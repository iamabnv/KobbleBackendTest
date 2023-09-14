//
//  Genders.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/16/23.
//

import Foundation

enum ConstGender: String, Codable, Hashable {
    case male = "Male"
    case female = "Female"
    case nonBinary = "Non-binary"
    // Add more genders as needed
    
    static var allGenders: [ConstGender] {
        return [
            .male,
            .female,
            .nonBinary
            // Add more genders as needed
        ]
    }
}
