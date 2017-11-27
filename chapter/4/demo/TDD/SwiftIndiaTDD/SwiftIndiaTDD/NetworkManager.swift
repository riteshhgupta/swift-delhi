//
//  NetworkManager.swift
//  SwiftIndiaTDD
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import Foundation

enum Result<T> {
	case success(value: T)
	case error(error: NSError)
}

class NetworkManager {
	func signup(username: String, password: String, completion:  @escaping (Result<Bool>) -> ()) {
		//simulate network call
		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
			completion(Result.success(value: true))
		}
	}
}
