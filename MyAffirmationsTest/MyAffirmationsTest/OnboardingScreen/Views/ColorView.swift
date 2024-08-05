//
//  ColorView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct ColorView: View {
    
    // MARK: - Properties
    @Binding var selectedBGColor: BGColor
    
    // MARK: - Context
    var body: some View {
        VStack {
            Spacer()
            Text(Localization.selectColor.localized.uppercased())
                .font(.title)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { BGColor.allCases.firstIndex(of: selectedBGColor) ?? .zero },
                    set: { selectedBGColor = BGColor.allCases[$0] }
                ),
                attribute: .init(
                    items: BGColor.allCases.map {
                        $0.displayName.uppercased() }
                )
            )
            .padding()
            Spacer()
        }
    }
}
