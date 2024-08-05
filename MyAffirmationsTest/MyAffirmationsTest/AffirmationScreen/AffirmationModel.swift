//
//  AffirmationModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation

// MARK: - AffirmationModel
struct AffirmationModel: Decodable {
    let love: [String]
    let friendship: [String]
    let loveMale: [String]
    let loveFemale: [String]
    let friendshipMale: [String]
    let friendshipFemale: [String]
    
    enum CodingKeys: String, CodingKey {
        case love
        case friendship
        case loveMale = "love_male"
        case loveFemale = "love_female"
        case friendshipMale = "friendship_male"
        case friendshipFemale = "friendship_female"
    }
}
