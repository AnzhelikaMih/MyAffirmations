//
//  AffirmationModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation

// MARK: - AffirmationModel
struct AffirmationModel: Decodable {
    var love: [String]
    var friendship: [String]
    var love_male: [String]
    var love_female: [String]
    var friendship_male: [String]
    var friendship_female: [String]
}
