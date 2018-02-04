//
//  Helpers.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 03/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

final class TextField: UITextField {
	
	var value: ((String) -> Void)?
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		register()
	}
	
	func register() {
		addTarget(
			self, action:
			#selector(didChangeTextFieldValue(_:)),
			for: .editingChanged
		)
	}
	
	@objc func didChangeTextFieldValue(_ sender: UITextField) {
		value?(sender.text!)
	}
}
