//
//  CategoryView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct CategoryView: View {
    
    // MARK: - Properties
    @Binding var selectedCategory: Category

    // MARK: - Context
    var body: some View {
        VStack {
            Spacer()
            Text(Localization.selectCategory.localized.uppercased())
                .font(.title)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { Category.allCases.firstIndex(of: selectedCategory) ?? 0 },
                    set: { selectedCategory = Category.allCases[$0] }
                ),
                attribute: .init(
                    items: Category.allCases.map { $0.displayName.uppercased() }
                )
            )
            .padding()
            Spacer()
        }
    }
}
