//
//  ViewController.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 03/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	
	var presenter: SearchViewPresenter!
	var viewModel: SearchViewModel!

	@IBOutlet var textField: TextField! {
		didSet {
			textField.value = { text in
				// 4. throttle text value
				// 5. hit cache and get relevant data
				// 6. reload table
			
				self.viewModel.fetchItems(for: text) { items in
					self.tableView.reloadData()
				}
			}
		}
	}
	
	@IBOutlet var tableView: UITableView! {
		didSet {
			// 1. register cells
			presenter.registerCells(in: tableView)
			
			// 2. register delegate/datasource
			tableView.delegate = presenter
			tableView.dataSource = viewModel
			
			// 3. handle table item selection
			presenter.didSelectItem = { indexPath in
				print(indexPath.row)
			}
		}
	}
	
	@IBAction func didTapDismissButton(_ sender: UIButton) {
		textField.resignFirstResponder()
	}	
}
