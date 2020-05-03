//
//  ButtonsViewController+ContentView+ButtonView.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension ButtonsViewController.ContentView {
    
    final class ButtonView: UIView {
        
        private let feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
        
        private lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = feedbackStyle.title
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            return label
        }()
        
        private lazy var button: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(feedbackStyle.title, for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            return button
        }()
        
        // MARK: - Properties
        
        init(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
            self.feedbackStyle = feedbackStyle
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
            setupActions()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Private
        
        private func setupComponents() {
            button.contentEdgeInsets = UIEdgeInsets(top: 18, left: 24, bottom: 18, right: 24)
        }
        
        private func setupLayout() {
            [titleLabel, button].forEach { view in
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
                button.centerXAnchor.constraint(equalTo: centerXAnchor),
                button.bottomAnchor.constraint(equalTo: bottomAnchor),
            ])
        }
        
        private func setupActions() {
            button.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        }
        
        @objc
        private func touchUp() {
            let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
            generator.prepare()
            generator.impactOccurred()
        }
        
    }
    
}
