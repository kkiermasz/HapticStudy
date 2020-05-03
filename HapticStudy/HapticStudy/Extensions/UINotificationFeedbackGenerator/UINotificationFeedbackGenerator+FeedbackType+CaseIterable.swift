//
//  UINotificationFeedbackGenerator+FeedbackType+CaseIterable.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UINotificationFeedbackGenerator.FeedbackType: CaseIterable {
    
    public static var allCases: [Self] {
        [.success, .warning, .error]
    }
    
}
