//
//  UseCase+Kind.swift
//  HapticStudy
//
//  Created by jaki on 19/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UseCasesViewController.UseCase {
    
    enum Kind: String, CaseIterable {
        
        // MARK: - Cases
        
        case buttons
        case sliders
        case switches
        case errors
        case list
        
        // MARK: - Properties
        
        var viewController: UIViewController {
            switch self {
            case .buttons: return ButtonsViewController()
            case .sliders: return SlidersViewController()
            case .switches: return SwitchesViewController()
            case .errors: return ErrorViewController()
            case .list: return ListTypesViewController()
            }
        }
        
        var title: String { rawValue.prefix(1).capitalized + rawValue.dropFirst() }
        
    }
    
}
