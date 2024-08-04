//
//  SegmentPicker.Attribute.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import UIKit

extension SegmentPicker {
    
    // MARK: - Attribute Structure
    public struct Attribute {
        let items: [String]
        let backgroundColor: UIColor
        let selectedSegmentColor: UIColor
        let normalSegmentStyle: SegmentStyle
        let selectedSegmentStyle: SegmentStyle
        let valueChanged: ((Int) -> Void)?
        
        public init(
            items: [String],
            backgroundColor: UIColor = .lightGray,
            selectedSegmentColor: UIColor = .white,
            normalSegmentStyle: SegmentStyle = .init(
                foregroundColor: .lightText,
                font: UIFont.systemFont(ofSize: 20)
            ),
            selectedSegmentStyle: SegmentStyle = .init(
                foregroundColor: .secondaryLabel,
                font: UIFont.systemFont(ofSize: 20)
            ),
            valueChanged: ((Int) -> Void)? = nil
        ) {
            self.items = items
            self.backgroundColor = backgroundColor
            self.selectedSegmentColor = selectedSegmentColor
            self.normalSegmentStyle = normalSegmentStyle
            self.selectedSegmentStyle = selectedSegmentStyle
            self.valueChanged = valueChanged
        }
    }
    
    // MARK: - SegmentStyle Structure
       public struct SegmentStyle {
           let foregroundColor: UIColor
           let font: UIFont
           
           public init(
               foregroundColor: UIColor,
               font: UIFont
           ) {
               self.foregroundColor = foregroundColor
               self.font = font
           }
       }
}
