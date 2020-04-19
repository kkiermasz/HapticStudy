//
//  UseCasesViewController+Cell.swift
//  HapticStudy
//
//  Created by jaki on 19/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

let UseCasesViewControllerCellIdentifier = "ComponentsTableViewCell"

extension UseCasesViewController {
    
    final class Cell: UITableViewCell {
        
        // MARK: - Properties
        
        var title: String = "" {
           didSet {
               textLabel?.text = title
           }
       }
       
       // MARK: - Initialization
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           accessoryType = .disclosureIndicator
       }
       
       required init?(coder: NSCoder) { nil }
        
    }
    
}
