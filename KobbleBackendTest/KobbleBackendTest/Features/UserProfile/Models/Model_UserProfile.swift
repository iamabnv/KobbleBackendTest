//
//  Model_UserProfile.swift
//  KobbleBackendTest
//
//  Created by Abhinav Srivastava on 7/16/23.
//

import Foundation
import FirebaseFirestoreSwift

struct MUserProfile_Primary: Codable {
    @DocumentID var id: String?
    var name: String
    var email: String?
    var phoneNumber: String?
    var gender: ConstGender
}
