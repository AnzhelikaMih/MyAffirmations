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
            Spacer()
            Text("select_gender".localized.uppercased())
                .font(.title)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { Gender.allCases.firstIndex(of: selectedGender) ?? 0 },
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
