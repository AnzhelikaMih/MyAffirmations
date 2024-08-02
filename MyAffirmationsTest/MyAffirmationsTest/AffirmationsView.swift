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
                        .padding()
                        .font(.title)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(maxWidth: 350, maxHeight: .infinity)
                        .padding()
                        .rotationEffect(.degrees(-90))
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(minWidth: UIScreen.main.bounds.height - 200, minHeight: UIScreen.main.bounds.width)
            .rotationEffect(.degrees(90))
        }
    }
}
