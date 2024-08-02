//
//  CategoryView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI

struct CategoryView: View {
    @Binding var selectedCategory: Category

    var body: some View {
        VStack {
            Spacer()
            Text("choose_category".localized.uppercased())
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .padding()
                .multilineTextAlignment(.center)
            Spacer()
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

