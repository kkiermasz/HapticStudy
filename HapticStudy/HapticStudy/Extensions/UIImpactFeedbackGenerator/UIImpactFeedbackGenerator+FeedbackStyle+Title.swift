//
//  UIImpactFeedbackGenerator+FeedbackStyle+Title.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UIImpactFeedbackGenerator.FeedbackStyle {
    
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

