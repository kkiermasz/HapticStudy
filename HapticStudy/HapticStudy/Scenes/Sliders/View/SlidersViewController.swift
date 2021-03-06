//
//  SlidersViewController.swift
//  HapticStudy
//
//  Created by jaki on 19/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

final class SlidersViewController: UIViewController {
    
    // MARK: - Properties
    
    private let contentView = ContentView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        
        title = "Sliders"
    }
    
}
