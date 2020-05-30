//
//  ListViewController.swift
//  HapticStudy
//
//  Created by jaki on 22/05/2020.
//  Copyright © 2020 Jakub Kiermasz. All rights reserved.
//

import UIKit

final class ListViewController: UITableViewController {
    
    // MARK: - Properties
    
    private let items = ["First item", "Second item", "Third item"]
    
    private let feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle
    
    // MARK: - Initialization
    
    init(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        self.feedbackStyle = feedbackStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        title = "\(feedbackStyle.title) feedback list"
        
        tableView.register(Cell.self, forCellReuseIdentifier: ListViewControllerCellIdentifier)
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewControllerCellIdentifier, for: indexPath) as! Cell
        cell.title = items[indexPath.item]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
        generator.prepare()
        generator.impactOccurred()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(150)) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

