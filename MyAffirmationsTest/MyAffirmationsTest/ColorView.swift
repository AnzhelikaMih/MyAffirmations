//
//  ColorView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct ColorView: View {
    @Binding var selectedBGColor: BGColor
    
    var body: some View {
        VStack {
            Spacer()
            Text("choose_color".localized.uppercased())
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { BGColor.allCases.firstIndex(of: selectedBGColor) ?? 0 },
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
