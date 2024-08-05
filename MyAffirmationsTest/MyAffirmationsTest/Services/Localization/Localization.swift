//
//  Localization.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation

enum Localization: String {
    
    case blue = "blue"
    case category = "category"
    case color = "color"
    case error = "error"
    case female = "female"
    case friendship = "friendship"
    case gender = "gender"
    case language = "language";
    case loading = "loading"
    case love = "love"
    case male = "male"
    case nextButton = "next_button"
    case red = "red"
    case selectCategory = "select_category"
    case selectColor = "select_color"
    case selectGender = "select_gender"
    case startButton = "start_button"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "\(self) could not localized")
    }
}
