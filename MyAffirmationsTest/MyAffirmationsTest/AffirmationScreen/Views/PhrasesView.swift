//
//  PhrasesView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct PhrasesView: View {
    
    // MARK: - Constants
    public enum Constants {
        static let radiusForShadowBlur: CGFloat = 5
        static let setShadowOffWidth: CGFloat = 2
        static let setShadowOffHight: CGFloat = 5
        static let rotationDegreesOne: CGFloat = 270
        static let rotationDegreesTwo: CGFloat = 90
    }
    
    // MARK: - Properties
    let affirmations: [String]
    
    // MARK: - Context
    var body: some View {
        VStack {
            TabView {
                ForEach(affirmations, id: \.self) { phrase in
                    Text(phrase)
                        .font(.largeTitle)
                        .fontDesign(.rounded)
                        .shadow(
                            color: .black,
                            radius: Constants.radiusForShadowBlur,
                            x: Constants.setShadowOffWidth,
                            y: Constants.setShadowOffHight
                        )
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .rotationEffect(.degrees(Constants.rotationDegreesOne))
                        .padding(.horizontal)
                }
            }
            .rotationEffect(.degrees(Constants.rotationDegreesTwo))
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
