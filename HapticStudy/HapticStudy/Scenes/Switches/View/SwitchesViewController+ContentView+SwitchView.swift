//
//  SwitchesViewController+ContentView+SwitchView.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension SwitchesViewController.ContentView {
    
    final class SwitchView: UIView {
        
        private let feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = feedbackStyle.title
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            return label
        }()
        
        private let `switch`: Switch = {
            let `switch` = Switch()
            `switch`.leftText = "Left"
            `switch`.rightText = "Right"
            return `switch`
        }()
        
        // MARK: - Properties
        
        init(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
            self.feedbackStyle = feedbackStyle
            super.init(frame: .zero)
            
            setupLayout()
            setupActions()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Private
        
        private func setupLayout() {
            [titleLabel, `switch`].forEach { view in
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                `switch`.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
                `switch`.leadingAnchor.constraint(equalTo: leadingAnchor),
                `switch`.trailingAnchor.constraint(equalTo: trailingAnchor),
                `switch`.bottomAnchor.constraint(equalTo: bottomAnchor),
                `switch`.heightAnchor.constraint(equalToConstant: 48),
            ])
        }
        
        private func setupActions() {
            `switch`.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        }
        
        @objc
        private func valueChanged() {
            let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
            generator.prepare()
            generator.impactOccurred()
        }
        
    }
    
}
