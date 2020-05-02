//
//  SwitchesViewController+ContentView.swift
//  HapticStudy
//
//  Created by jaki on 02/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension SwitchesViewController {
    
    final class ContentView: UIView {
        
        // MARK: - Properties
        
        private let containerView = UIView()
        
        private let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.showsVerticalScrollIndicator = false
            return scrollView
        }()
        
        private let firstSwitch: UISwitch = {
            let `switch` = UISwitch()
            return `switch`
        }()
        
        // MARK: - Initialization
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupComponents()
            setupLayout()
        }
        
        required init?(coder: NSCoder) { nil }
        
        // MARK: - Private
        
        private func setupComponents() {
            backgroundColor = .white
        }
        
        private func setupLayout() {
            addSubview(scrollView)
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(containerView)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            [firstSwitch].forEach { view in
                containerView.addSubview(view)
                view.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let constraints = [scrollView.topAnchor.constraint(equalTo: topAnchor),
                               scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
                               scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
                               scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
                               containerView.widthAnchor.constraint(equalTo: widthAnchor),
                               containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                               containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                               containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                               containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                               firstSwitch.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24),
                               firstSwitch.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
                               firstSwitch.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
                               firstSwitch.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24)]
            NSLayoutConstraint.activate(constraints)
        }
        
    }
    
}
