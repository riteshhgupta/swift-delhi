//
//  SpeakerSearchViewModel.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 04/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

final class SpeakerSearchViewModel: NSObject, SearchViewModel {
	
	var data: [Any] = []
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellId = "SpeakerTableViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SpeakerTableViewCell
		let text = data[indexPath.row] as! String
		cell.configureSpeaker(with: text)
		return cell
	}
	
	func fetchItems(for text: String, completion: (([Any]) -> Void)) {
		data = (0..<100).map { _ in return text }
		completion(data)
	}
}
