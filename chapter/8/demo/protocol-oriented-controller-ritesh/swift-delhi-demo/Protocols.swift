//
//  Protocols.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 03/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewPresenter: UITableViewDelegate {
	
	var didSelectItem: ((IndexPath) -> Void)? { get set }
	func registerCells(in tableView: UITableView)
}

protocol SearchViewModel: UITableViewDataSource {

	func fetchItems(for text: String, completion: (([Any]) -> Void))
}
