//
//  SettingsModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case love, friendship
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .love: return Localization.love.localized
        case .friendship: return Localization.friendship.localized
        }
    }
}

enum BGColor: String, CaseIterable, Identifiable {
    case blue, red
    
    var id: String { self.rawValue }
    var color: Color {
        switch self {
        case .blue: return Color.blue.opacity(0.5)
        case .red: return Color.red.opacity(0.5)
        }
    }
    
    var displayName: String {
        switch self {
        case .blue: return Localization.blue.localized
        case .red: return Localization.red.localized
        }
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case male, female
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .male: return Localization.male.localized
        case .female: return Localization.female.localized
        }
    }
}
