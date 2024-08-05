//
//  SettingsModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

// MARK: - Constants
private enum Constants {
    static let customBlue: String = "CustomBlue"
    static let customRed: String = "CustomRed"
}

// MARK: - CategoryModel
enum Category: String, CaseIterable, Identifiable {
    case love, friendship
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .love: return Localization.love.localized
        case .friendship: return Localization.friendship.localized
        }
    }
    
    var localized: String {
        return Localization(rawValue: self.rawValue)?.localized ?? self.rawValue.capitalized
    }
}

// MARK: - BackGroundColorModel
enum BGColor: String, CaseIterable, Identifiable {
    case blue, red
    
    var id: String { self.rawValue }
    var color: Color {
        switch self {
        case .blue: return Color(Constants.customBlue)
        case .red: return Color(Constants.customRed)
        }
    }
    
    var displayName: String {
        switch self {
        case .blue: return Localization.blue.localized
        case .red: return Localization.red.localized
        }
    }
    
    var localized: String {
        return Localization(rawValue: self.rawValue)?.localized ?? self.rawValue.capitalized
    }
}

// MARK: - GenderModel
enum Gender: String, CaseIterable, Identifiable {
    case male, female
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .male: return Localization.male.localized
        case .female: return Localization.female.localized
        }
    }
    
    var localized: String {
        return Localization(rawValue: self.rawValue)?.localized ?? self.rawValue.capitalized
    }
}
