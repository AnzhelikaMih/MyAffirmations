//
//  SettingsModel.swift
//  AffirmationsSpark
//
//  Created by Анжелика on 2.08.24.
//

//import Foundation
import SwiftUI

enum Category: String, CaseIterable, Identifiable {
    case love, friendship
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .love: return "love".localized
        case .friendship: return "friendship".localized
        }
    }
}

enum BGColor: String, CaseIterable, Identifiable {
    case blue, red
    
    var id: String { self.rawValue }
    var color: Color {
        switch self {
        case .blue: return Color.blue
        case .red: return Color.red
        }
    }
    
    var displayName: String {
        switch self {
        case .blue: return "blue".localized
        case .red: return "red".localized
        }
    }
    
    var backgroundImage: String {
        switch self {
        case .blue: return "bg_blue"
        case .red: return "bg_red"
        }
    }
}

enum Gender: String, CaseIterable, Identifiable {
    case male, female
    
    var id: String { self.rawValue }
    var displayName: String {
        switch self {
        case .male: return "male".localized
        case .female: return "female".localized
        }
    }
}

struct Affirmations {
    var love: [String]
    var friendship: [String]
}
    
    
