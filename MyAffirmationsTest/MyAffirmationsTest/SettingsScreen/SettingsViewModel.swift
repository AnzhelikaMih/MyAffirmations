//
//  SettingsViewModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 5.08.24.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    
    // MARK: - Properties
    @AppStorage("category") var selectedCategory: Category = .love
    @AppStorage("color") var selectedBGColor: BGColor = .blue
    @AppStorage("gender") var selectedGender: Gender = .male
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}
