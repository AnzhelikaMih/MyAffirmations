//
//  MainViewModel.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 4.08.24.
//

import SwiftUI
import Combine

final class AffirmationsViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var affirmations: AffirmationsModel?
    @Published var isLoading: Bool = false
    @Published var error: String?

    private let networkService: NetworkServiceProtocol

    // MARK: - Init
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Methods
    func loadAffirmations() {
        isLoading = true
        networkService.loadData { [weak self] model in
            self?.isLoading = false
            if let model = model {
                self?.affirmations = model
            } else {
                self?.error = "Failed to load data."
                print("Failed to load data.")
            }
        }
    }
}
