//
//  StringsExtension.swift
//  AffirmationsSpark
//
//  Created by Анжелика on 2.08.24.
//

import Foundation
import SwiftUI

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "\(self) could not localized")
    }
}
