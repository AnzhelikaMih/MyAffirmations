//
//  MainView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Constants
    enum Constants {
        static let icon = "text.justify"
    }
    
    // MARK: - Properties
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBGColor: BGColor = .blue
    @AppStorage("gender") private var selectedGender: Gender = .male
    
    @StateObject private var viewModel = AffirmationsViewModel()
    
    // MARK: - Content
    var body: some View {
        if onboardingChecked {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        print("1")
                    }, label: {
                        Image(systemName: Constants.icon)
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: 40, maxHeight: 40)
                            .padding()
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView(Localization.loading.localized)
                        .font(.title)
                        .foregroundColor(.white)
                    Spacer()
                } else if let affirmations = viewModel.affirmations {
                    AffirmationsView(affirmations: selectedCategory == .love ? affirmations.love : affirmations.friendship)
                } else if let error = viewModel.error {
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
        } else {
            OnboardingStageView()
        }
    }
}

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
