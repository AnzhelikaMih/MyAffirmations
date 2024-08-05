//
//  SettingsView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 5.08.24.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: - Properties
    @ObservedObject private var viewModel = SettingsViewModel()
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Content
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(Localization.category.localized)) {
                    Picker(Localization.selectCategory.localized, selection: $viewModel.selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.localized).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text(Localization.color.localized)) {
                    Picker(Localization.selectColor.localized, selection: $viewModel.selectedBGColor) {
                        ForEach(BGColor.allCases, id: \.self) { color in
                            Text(color.localized).tag(color)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text(Localization.gender.localized)) {
                    Picker(Localization.selectGender.localized, selection: $viewModel.selectedGender) {
                        ForEach(Gender.allCases, id: \.self) { gender in
                            Text(gender.localized).tag(gender)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Section(header: Text(Localization.language.localized)) {
                    Button(action: {
                        viewModel.openSettings()
                    }) {
                        Text(Localization.selectLanguage.localized)
                    }
                }
            }
            .navigationBarTitle(Localization.settings.localized)
            .navigationBarItems(trailing: Button(Localization.done.localized) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Content
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsViewModel())
    }
}
