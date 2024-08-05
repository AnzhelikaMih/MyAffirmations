//
//  OnboardingViewModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 5.08.24.
//

import SwiftUI

final class OnboardingStageViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var currentStep: Int = 0
    
    @AppStorage("category") var selectedCategory: Category = .love
    @AppStorage("color") var selectedBGColor: BGColor = .blue
    @AppStorage("gender") var selectedGender: Gender = .male
    
    func nextStep() {
        currentStep += 1
    }
}
