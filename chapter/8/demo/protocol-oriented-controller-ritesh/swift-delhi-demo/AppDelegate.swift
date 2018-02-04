//
//  AppDelegate.swift
//  swift-delhi-demo
//
//  Created by Ritesh Gupta on 03/02/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let window = UIWindow(frame: UIScreen.main.bounds)

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		window.rootViewController = rootVC
		window.makeKeyAndVisible()
		return true
	}
	
	var rootVC: UIViewController {
		let sb = UIStoryboard(name: "Main", bundle: nil)
		let controller = sb.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
		
		// if event search
		controller.presenter = EventSearchViewPresenter()
		controller.viewModel = EventSearchViewModel()
		
		// if speaker search
		//	controller.presenter = SpeakerSearchViewPresenter()
		//	controller.viewModel = SpeakerSearchViewModel()
		return controller
	}
}
