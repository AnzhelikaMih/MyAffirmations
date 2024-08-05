//
//  AffirmationsView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct AffirmationsView: View {
    
    // MARK: - Properties
    let affirmations: [String]
    
    // MARK: - Context
    var body: some View {
        VStack {
            TabView {
                ForEach(affirmations, id: \.self) { phrase in
                    Text(phrase)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .rotationEffect(.degrees(270))
                        .padding(.horizontal)
                }
            }
            .rotationEffect(.degrees(90))
            .tabViewStyle(PageTabViewStyle())
        }
    }
}
