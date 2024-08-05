//
//  AddAffirmationView.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 5.08.24.
//

import SwiftUI

struct AddAffirmationView: View {
    
    // MARK: - Context
    var body: some View {
        VStack {
            Spacer()
            Text(Localization.stub_label.localized)
                .font(.title)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.clear)
        .edgesIgnoringSafeArea(.all)
    }
}

// MARK: - Preview
struct AddAffirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AddAffirmationView()
    }
}
