//
//  MainView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBGColor: BGColor = .blue
    
    @StateObject private var viewModel = AffirmationsViewModel()
    
    // MARK: - Components
    var body: some View {
        if onboardingChecked {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        print("1")
                    }, label: {
                        Image(systemName: "text.justify")
                            .foregroundColor(.secondary)
                            .font(.title)
                            .frame(maxWidth: 40, maxHeight: 40)
                            .padding()
                    })
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let affirmations = viewModel.affirmations {
                    AffirmationsView(affirmations: selectedCategory == .love ? affirmations.love : affirmations.friendship)
                } else if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
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
