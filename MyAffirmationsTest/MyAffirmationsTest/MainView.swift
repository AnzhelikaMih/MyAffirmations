//
//  MainView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onboardingChecked") private var onboardingChecked: Bool = false
    @AppStorage("сolor") private var selectedBackgroundColor: BGColor = .blue
    
    let affirmations = Affirmations.init(
        love: [
            "I am worthy of love and deserve to receive love in abundance",
            "My heart is open to giving and receiving love",
            "I am surrounded by love every day and in every way",
            "I attract love and loving relationships into my life",
            "Love flows to me and through me effortlessly",
            "I radiate love and others reflect love back to me",
            "My relationships are filled with love, happiness, and respect",
            "I am grateful for the love that surrounds me",
            "Love comes to me easily and effortlessly",
            "I am a magnet for loving and fulfilling relationships"
        ],
        friendship: [
            "I am surrounded by supportive and loving friends",
            "I attract positive and loyal friendships into my life",
            "My friends and I share mutual respect and trust",
            "I am a kind and caring friend, and I receive the same in return",
            "My friendships are filled with joy, laughter, and understanding",
            "I am grateful for the amazing friends in my life",
            "I nurture and cherish my friendships",
            "I attract friends who support and uplift me",
            "My friends and I grow together in love and harmony",
            "I am a magnet for genuine and lasting friendships"
        ]
    )
    
    var body: some View {
        if onboardingChecked {
            ZStack {
                Image(selectedBackgroundColor.backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            print("1")
                        }, label: {
                            Image(systemName: "distribute.vertical")
                                .foregroundColor(.black)
                                .frame(maxWidth: 40, maxHeight: 40)
                                .background(.white)
                                .cornerRadius(5)
                                .padding(.trailing)
                        })
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .padding(.trailing)
                    
                    AffirmationsView(affirmations: affirmations.love)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.clear)
                
            }
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
