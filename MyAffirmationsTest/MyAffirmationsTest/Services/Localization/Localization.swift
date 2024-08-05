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
    case done = "done"
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
    case selectLanguage = "select_language"
    case settings = "settings"
    case startButton = "start_button"
    case stub_label = "stub_label"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "\(self) could not localized")
    }
}
