//
//  ListTypesViewController+Cell.swift
//  HapticStudy
//
//  Created by jaki on 22/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

let ListTypesViewControllerCellIdentifier = "ListTypesTableViewCell"

extension ListTypesViewController {
    
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
