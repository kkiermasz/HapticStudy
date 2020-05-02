//
//  UseCase+Kind.swift
//  HapticStudy
//
//  Created by jaki on 19/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UseCasesViewController.UseCase {
    
    enum Kind {
        
        // MARK: - Cases
        
        case buttons
        case sliders
        case switches
        
        // MARK: - Properties
        
        var viewController: UIViewController {
            switch self {
            case .buttons: return UIViewController()
            case .sliders: return SlidersViewController()
            case .switches: return SwitchesViewController()
            }
        }
        
        var title: String {
            switch self {
            case .buttons: return "Buttons"
            case .sliders: return "Sliders"
            case .switches: return "Switches"
            }
        }
    }
    
}
