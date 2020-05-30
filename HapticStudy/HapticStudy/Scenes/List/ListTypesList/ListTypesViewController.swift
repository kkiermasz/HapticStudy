//
//  ListTypesViewController.swift
//  HapticStudy
//
//  Created by jaki on 22/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

final class ListTypesViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let listTypes = UIImpactFeedbackGenerator.FeedbackStyle.allCases
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        title = "List types"
        
        tableView.register(Cell.self, forCellReuseIdentifier: ListTypesViewControllerCellIdentifier)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { listTypes.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTypesViewControllerCellIdentifier, for: indexPath) as! Cell
        let item = listTypes[indexPath.item]
        cell.title = item.title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = listTypes[indexPath.item]
        let viewController = ListViewController(feedbackStyle: item)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

