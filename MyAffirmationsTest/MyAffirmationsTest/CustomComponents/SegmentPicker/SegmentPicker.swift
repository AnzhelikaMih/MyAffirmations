//
//  SegmentPicker.swift
//  MyAffirmationsTest
//
//  Created by Анжелика on 2.08.24.
//

import UIKit

public final class SegmentPicker: UISegmentedControl {
    
    // MARK: - Constants
    private enum Constants {
        static let segmentInset: CGFloat = 1
        static let height: CGFloat = 56
        static let animationKey: String = "SelectionBounds"
    }
    
    // MARK: - Properties
    private var valueChanged: ((Int) -> Void)?
    
    private var selectedSegmentColor: UIColor?
    
    private var attribute: SegmentPicker.Attribute? {
        didSet {
            guard let attribute = attribute else { return }
            updateView(with: attribute)
        }
    }
    
    // MARK: - Init
    init(attribute: Attribute) {
        super.init(items: attribute.items)
        setupView()
        updateView(with: attribute)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupView() {
        addTarget(self, action: #selector(didTap), for: .valueChanged)
    }
    
    private func updateView(with attribute: Attribute) {
        setTitleTextAttributes(
            [
                .foregroundColor: attribute.normalSegmentStyle.foregroundColor,
                .font: attribute.normalSegmentStyle.font
            ],
            for: .normal
        )
        setTitleTextAttributes(
            [
                .foregroundColor: attribute.selectedSegmentStyle.foregroundColor,
                .font: attribute.selectedSegmentStyle.font
            ],
            for: .selected
        )
        self.backgroundColor = attribute.backgroundColor
        self.valueChanged = attribute.valueChanged
        self.selectedSegmentColor = attribute.selectedSegmentColor
    }
    
    // MARK: - Layout
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // MARK: - background
        layer.cornerRadius = bounds.height/2
        bounds.size.height = Constants.height
        
        // MARK: - foreground
        let foregroundIndex = numberOfSegments
            if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
                foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: Constants.segmentInset, dy: Constants.segmentInset)
                foregroundImageView.image = nil
                foregroundImageView.backgroundColor = selectedSegmentColor
                foregroundImageView.layer.removeAnimation(forKey: Constants.animationKey)
                foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
            }
    }

    // MARK: - Action
    @objc private func didTap() {
        valueChanged?(selectedSegmentIndex)
    }
}
