//
//  OnboardingStageView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct OnboardingStageView: View {
    
    // MARK: - Constants
    enum Constants {
        static let icon = "bg_onboarding"
    }
    
    // MARK: - Properties
    @State private var currentStep: Int = 0
    
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBGColor: BGColor = .blue
    @AppStorage("gender") private var selectedGender: Gender = .male
    
    // MARK: - Context
    var body: some View {
        ZStack {
            Image(Constants.icon)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                switch currentStep {
                case 0:
                    CategoryView(selectedCategory: $selectedCategory)
                        .transition(.move(edge: .top))
                case 1:
                    ColorView(selectedBGColor: $selectedBGColor)
                        .transition(.move(edge: .top))
                case 2:
                    GenderView(selectedGender: $selectedGender)
                        .transition(.move(edge: .top))
                default:
                    EmptyView()
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        currentStep < 2 ? (currentStep += 1) : (onboardingChecked = true)
                    }
                    
                }) {
                    Text(currentStep < 2 ? Localization.nextButton.localized.uppercased() : Localization.startButton.localized.uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.secondary)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 50)
            }
            .padding()
        }
    }
}
