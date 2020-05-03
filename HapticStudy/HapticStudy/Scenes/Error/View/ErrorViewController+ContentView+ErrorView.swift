//
//  ErrorViewController+ContentView+ErrorView.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension ErrorViewController.ContentView {
    
    final class ErrorView: UIView {
        
        private let feedbackType: UINotificationFeedbackGenerator.FeedbackType
        
        private lazy var button: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle(feedbackType.title, for: .normal)
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 8
            return button
        }()
        
        private lazy var errorLabel: UILabel = {
            let label = UILabel()
            label.textColor = .systemRed
            label.font = .boldSystemFont(ofSize: 14)
            label.text = "\(feedbackType.title) notification!"
            label.textAlignment = .center
            label.isHidden = true
            return label
        }()
        
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 2
            stackView.axis = .vertical
            return stackView
        }()
        
        private var errorHideWorkItem: DispatchWorkItem?
        
        // MARK: - Properties
        
        init(_ feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
            self.feedbackType = feedbackType
            super.init(frame: .zero)
            
            setupComponents()
            setupLayout()
            setupActions()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Private
        
        private func setupComponents() {
            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        }
        
        private func setupLayout() {
            addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            [button, errorLabel].forEach(stackView.addArrangedSubview(_:))
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
        
        private func setupActions() {
            button.addTarget(self, action: #selector(touchUp), for: .touchUpInside)
        }

        @objc
        private func touchUp() {
            showError()
        }
        
        private func showError() {
            if errorLabel.isHidden {
                let generator = UINotificationFeedbackGenerator()
                generator.prepare()
                generator.notificationOccurred(feedbackType)
                
                UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.3, options: [], animations: {
                    self.errorLabel.isHidden = false
                    self.layoutIfNeeded()
                }, completion: { [weak self] _ in
                    self?.scheduleHide()
                })
            } else {
                errorHideWorkItem?.cancel()
                scheduleHide()
            }
        }
        
        private func scheduleHide() {
            errorHideWorkItem = DispatchWorkItem {
                UIView.animate(withDuration: 0.45, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                    self.errorLabel.isHidden = true
                    self.layoutIfNeeded()
                }, completion: nil)
            }
            
            guard let item = errorHideWorkItem else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: item)
        }
        
    }
    
}
