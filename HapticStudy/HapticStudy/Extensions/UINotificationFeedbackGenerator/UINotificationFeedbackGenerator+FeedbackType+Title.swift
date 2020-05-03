//
//  UINotificationFeedbackGenerator+FeedbackType+Title.swift
//  HapticStudy
//
//  Created by jaki on 03/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UINotificationFeedbackGenerator.FeedbackType {
    
    var title: String {
        switch self {
        case .success: return "Success"
        case .warning: return "Warning"
        case .error: return "Error"
        @unknown default: return "Not implemented"
        }
    }
    
}
