//
//  SlidersViewController+ContentView+SliderView.swift
//  HapticStudy
//
//  Created by jaki on 02/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension SlidersViewController.ContentView {
    
    final class SliderView: UIView {
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .center
            return label
        }()
        
        private let slider: TactileSlider = {
            let slider = TactileSlider()
            slider.thumbTint = .systemBlue
            slider.trackBackground = .systemGray6
            return slider
        }()
        
        // MARK: - Properties
        
        init(_ feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
            super.init(frame: .zero)
            titleLabel.text = feedbackStyle.title
            slider.feedbackStyle = feedbackStyle
            
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Private
        
        private func setupLayout() {
            [titleLabel, slider].forEach { view in
                addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
                slider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
                slider.leadingAnchor.constraint(equalTo: leadingAnchor),
                slider.trailingAnchor.constraint(equalTo: trailingAnchor),
                slider.bottomAnchor.constraint(equalTo: bottomAnchor),
                slider.heightAnchor.constraint(equalToConstant: 48),
            ])
        }
        
    }
    
}

private extension UIImpactFeedbackGenerator.FeedbackStyle {
    
    var title: String {
        switch self {
        case .heavy: return "Heavy"
        case .light: return "Light"
        case .medium: return "Medium"
        case .rigid: return "Rigid"
        case .soft: return "Soft"
        @unknown default: return "Not implemented"
        }
    }
    
}
