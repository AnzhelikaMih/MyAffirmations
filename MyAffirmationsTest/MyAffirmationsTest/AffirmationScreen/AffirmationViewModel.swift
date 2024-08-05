//
//  AffirmationViewModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 4.08.24.
//

import SwiftUI
import Combine

enum ViewState {
    case loading
    case loaded([String])
    case error(String)
}

final class AffirmationViewModel: ObservableObject {
    
    private enum Constants {
        static let ruLanguage: String = "ru"
    }
    
    // MARK: - Properties
    @Published var state: ViewState = .loading

    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("gender") private var selectedGender: Gender = .male
    
    private let networkService: NetworkServiceProtocol

    // MARK: - Init
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Methods
    func loadAffirmations() {
        state = .loading
        networkService.loadData { [weak self] model in
            if let model = model {
                let localizedAffirmations = self?.getLocalizedAffirmations(model) ?? []
                self?.state = .loaded(localizedAffirmations)
            } else {
                self?.state = .error(Localization.error.localized)
            }
        }
    }
    
    private func getLocalizedAffirmations(_ affirmations: AffirmationModel) -> [String] {
        let currentLanguage = Locale.current.language.languageCode?.identifier
        switch (currentLanguage, selectedCategory, selectedGender) {
        case (Constants.ruLanguage, .love, .male):
            return affirmations.loveMale
        case (Constants.ruLanguage, .love, .female):
            return affirmations.loveFemale
        case (Constants.ruLanguage, .friendship, .male):
            return affirmations.friendshipMale
        case (Constants.ruLanguage, .friendship, .female):
            return affirmations.friendshipFemale
        case (_, .love, _):
            return affirmations.love
        case (_, .friendship, _):
            return affirmations.friendship
        }
    }
}
