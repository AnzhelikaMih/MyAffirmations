//
//  SegmentPickerRepresentable.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import SwiftUI
import UIKit

struct SegmentPickerRepresentable: UIViewRepresentable {
    
    // MARK: - Properties
    @Binding var selectedSegmentIndex: Int
    var attribute: SegmentPicker.Attribute

    // MARK: - Methods
    func makeUIView(context: Context) -> UISegmentedControl {
        let segmentPicker = SegmentPicker(attribute: attribute)
        segmentPicker.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return segmentPicker
    }

    func updateUIView(_ uiView: UISegmentedControl, context: Context) {
        uiView.selectedSegmentIndex = selectedSegmentIndex
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator
    class Coordinator: NSObject {
        var parent: SegmentPickerRepresentable

        init(_ parent: SegmentPickerRepresentable) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: UISegmentedControl) {
            parent.selectedSegmentIndex = sender.selectedSegmentIndex
        }
    }
}


