//
//  UseCase.swift
//  HapticStudy
//
//  Created by jaki on 19/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

extension UseCasesViewController {
    
    struct UseCase {
        
        // MARK: - Properties
        
        let kind: Kind
        
        var viewController: UIViewController { kind.viewController }
        var title: String { kind.title }
        
    }
    
}
