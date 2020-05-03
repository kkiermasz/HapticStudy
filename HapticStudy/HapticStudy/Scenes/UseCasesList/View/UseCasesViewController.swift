//
//  UseCasesViewController.swift
//  HapticStudy
//
//  Created by jaki on 18/04/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

final class UseCasesViewController: UITableViewController {
    
    // MARK: - Properties
    
    let useCases = UseCase.Kind.allCases
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        title = "Use cases"
        
        tableView.register(Cell.self, forCellReuseIdentifier: UseCasesViewControllerCellIdentifier)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { useCases.count }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UseCasesViewControllerCellIdentifier, for: indexPath) as! Cell
        let item = useCases[indexPath.item]
        cell.title = item.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = useCases[indexPath.item]
        let viewController = item.viewController
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
