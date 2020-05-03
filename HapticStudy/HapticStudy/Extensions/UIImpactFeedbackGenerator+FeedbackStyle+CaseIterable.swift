//
//  UIImpactFeedbackGenerator+FeedbackStyle+CaseIterable.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UIImpactFeedbackGenerator.FeedbackStyle: CaseIterable {
    
    public static var allCases: [Self] {
        [.light, .medium, .heavy, .soft, .rigid]
    }
    
}
