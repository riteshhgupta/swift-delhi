//
//  EventTableViewCell.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 03/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
	
	@IBOutlet var label: UILabel!
	
	func configureEvent(with text: String) {
		label.text = text
	}
}
