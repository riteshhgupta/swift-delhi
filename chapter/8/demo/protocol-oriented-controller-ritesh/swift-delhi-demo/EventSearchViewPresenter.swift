//
//  EventSearchViewPresenter.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 04/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

final class EventSearchViewPresenter: NSObject, SearchViewPresenter {
	
	var didSelectItem: ((IndexPath) -> Void)?
	
	func registerCells(in tableView: UITableView) {
		let cellID = "EventTableViewCell"
		let nib = UINib(nibName: cellID, bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: cellID)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		didSelectItem?(indexPath)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150.0
	}
}
