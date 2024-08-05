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
            LabelView(title: Localization.selectCategory.localized)
            SegmentPickerRepresentable(
                selectedSegmentIndex: Binding(
                    get: { Category.allCases.firstIndex(of: selectedCategory) ?? .zero },
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
