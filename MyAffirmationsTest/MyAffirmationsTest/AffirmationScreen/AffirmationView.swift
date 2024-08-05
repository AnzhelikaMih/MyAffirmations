//
//  AffirmationView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct AffirmationView: View {
    
    // MARK: - Constants
    enum Constants {
        static let iconPlus: String = "plus"
        static let iconSettings: String = "text.justify"
        static let ru: String = "ru"
        static let buttonSize: CGFloat = 40
    }
    
    // MARK: - Properties
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBGColor: BGColor = .blue
    @AppStorage("gender") private var selectedGender: Gender = .male
    
    @StateObject private var viewModel = AffirmationViewModel()
    @State private var showAddAffirmation = false
    @State private var showSettings = false
    
    // MARK: - Content
    var body: some View {
        if onboardingChecked {
            VStack {
                HStack {
                    Button(action: {
                        showAddAffirmation = true
                    }, label: {
                        Image(systemName: Constants.iconPlus)
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: Constants.buttonSize, maxHeight: Constants.buttonSize)
                            .padding()
                    })
                    Spacer()
                    Button(action: {
                        showSettings = true
                    }, label: {
                        Image(systemName: Constants.iconSettings)
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: Constants.buttonSize, maxHeight: Constants.buttonSize)
                            .padding()
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                switch viewModel.state {
                case .loading:
                    Spacer()
                    ProgressView(Localization.loading.localized)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    
                case .loaded(let affirmations):
                    PhrasesView(affirmations: affirmations)
                    
                case .error(let error):
                    Spacer()
                    Text(error)
                        .foregroundColor(.red)
                        .font(.title)
                    Spacer()
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectedBGColor.color)
            .onAppear {
                viewModel.loadAffirmations()
            }
            .onChange(of: selectedCategory) { _ in
                viewModel.loadAffirmations()
            }
            .onChange(of: selectedBGColor) { _ in
                viewModel.loadAffirmations()
            }
            .onChange(of: selectedGender) { _ in
                viewModel.loadAffirmations()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView()
            }
            .sheet(isPresented: $showAddAffirmation) {
                AddAffirmationView()
            }
        } else {
            OnboardingView()
        }
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationView()
    }
}

