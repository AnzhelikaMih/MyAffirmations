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
        case ("ru", .love, .male):
            return affirmations.love_male
        case ("ru", .love, .female):
            return affirmations.love_female
        case ("ru", .friendship, .male):
            return affirmations.friendship_male
        case ("ru", .friendship, .female):
            return affirmations.friendship_female
        case (_, .love, _):
            return affirmations.love
        case (_, .friendship, _):
            return affirmations.friendship
        }
    }
}
