//
//  GenderView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct GenderView: View {
    @Binding var selectedGender: Gender
    
    var body: some View {
        VStack {
            Text("choose_gender".localized)
                .font(.largeTitle)
                .padding()
            
            Picker("gender".localized, selection: $selectedGender) {
                ForEach(Gender.allCases) { gender in
                    Text(gender.displayName.localized).tag(gender)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}
