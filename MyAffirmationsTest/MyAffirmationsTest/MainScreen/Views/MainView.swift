//
//  MainView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("category") private var selectedCategory: Category = .love
    @AppStorage("color") private var selectedBGColor: BGColor = .blue
    
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
                
                AffirmationsView(affirmations: affirmations.love)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectedBGColor.color)
        } else {
            OnboardingStage()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
