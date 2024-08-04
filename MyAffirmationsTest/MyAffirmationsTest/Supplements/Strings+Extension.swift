//
//  Strings+Extension.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 3.08.24.
//

import Foundation
import SwiftUI

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "\(self) could not localized")
    }
}
