//
//  CarouselView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct AffirmationsView: View {
    let affirmations: [String]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(affirmations, id: \.self) { phrase in
                    Text(phrase)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
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
