//
//  GenderView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct GenderView: View {
    
    // MARK: - Properties
    @Binding var selectedGender: Gender
    
    // MARK: - Context
    var body: some View {
        VStack {
            Spacer()
            LabelView(title: Localization.selectGender.localized)
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { Gender.allCases.firstIndex(of: selectedGender) ?? .zero },
                    set: { selectedGender = Gender.allCases[$0] }
                ),
                attribute: .init(
                    items: Gender.allCases.map { $0.displayName.uppercased() }
                )
            )
            .padding()
            Spacer()
        }
    }
}
