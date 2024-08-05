//
//  LabelView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 5.08.24.
//

import SwiftUI

struct LabelView: View {
    
    // MARK: - Properties
    var title: String
    
    // MARK: - Context
    var body: some View {
        Text(title)
            .font(.title)
            .foregroundColor(.gray)
            .padding()
            .multilineTextAlignment(.center)
    }
}
