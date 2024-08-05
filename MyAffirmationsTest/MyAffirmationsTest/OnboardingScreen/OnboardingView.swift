//
//  OnboardingView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Constants
    enum Constants {
        static let icon = "bg_onboarding"
        static let buttonHeight: CGFloat = 48
        static let buttonCornerRadius: CGFloat = 48
        static let horizontalPadding: CGFloat = 16
        static let bottomPadding: CGFloat = 50
    }
    
    // MARK: - Properties
    @StateObject private var viewModel = OnboardingStageViewModel()
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    
    // MARK: - Content
    var body: some View {
        ZStack {
            Image(Constants.icon)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                switch viewModel.currentStep {
                case 0:
                    CategoryView(selectedCategory: $viewModel.selectedCategory)
                        .transition(.move(edge: .top))
                case 1:
                    ColorView(selectedBGColor: $viewModel.selectedBGColor)
                        .transition(.move(edge: .top))
                case 2:
                    GenderView(selectedGender: $viewModel.selectedGender)
                        .transition(.move(edge: .top))
                default:
                    EmptyView()
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        if viewModel.currentStep < 2 {
                            viewModel.nextStep()
                        } else {
                            onboardingChecked = true
                        }
                    }
                }) {
                    Text(viewModel.currentStep < 2 ? Localization.nextButton.localized.uppercased() : Localization.startButton.localized.uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: Constants.buttonHeight)
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding([.leading, .trailing], Constants.horizontalPadding)
                .padding(.bottom, Constants.bottomPadding)
            }
            .padding()
        }
    }
}
