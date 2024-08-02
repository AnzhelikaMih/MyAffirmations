//
//  OnboardingStage.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct OnboardingStage: View {
    @State private var currentStep: Int = 0
    
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBackgroundColor: BGColor = .blue
    @AppStorage("gender") private var selectedGender: Gender = .male
    
    var body: some View {
        ZStack {
            Image("bg_onboarding")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                switch currentStep {
                case 0:
                    CategoryView(selectedCategory: $selectedCategory)
                        .transition(.move(edge: .leading))
                case 1:
                    ColorView(selectedBGColor: $selectedBackgroundColor)
                        .transition(.move(edge: .leading))
                case 2:
                    GenderView(selectedGender: $selectedGender)
                        .transition(.move(edge: .leading))
                default:
                    EmptyView()
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        if currentStep < 2 {
                            currentStep += 1
                        } else {
                            onboardingChecked = true
                        }
                    }
                    
                }) {
                    Text(currentStep < 2 ? "next_button".localized.uppercased() : "start_button".localized.uppercased())
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

