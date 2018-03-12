//
//  ViewController.swift
//  GraphQL-iOS
//
//  Created by Amanjeet Singh on 07/02/18.
//  Copyright © 2018 Amanjeet Singh. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    @IBOutlet weak var repoTextfield: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var displayInfo: UITextView!
    @IBOutlet weak var ownerTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showLoader(show: false)
        setDisplayString(displayString: "")
    }

    @IBAction func searchPressed(_ sender: Any) {
        setDisplayString(displayString: "")
        showLoader(show: true)
        
        if repoTextfield.text != "" && ownerTextField.text != "" {
            let repoText = repoTextfield.text!
            let ownerText = ownerTextField.text!
            
            //query
            apollo.fetch(query: FindQueryQuery(owner: ownerText, name:repoText)){
                (result,error) in
                if error == nil {
                    if let name = result?.data?.repository?.name, let description = result?.data?.repository?.description, let forkcount = result?.data?.repository?.forkCount, let url = result?.data?.repository?.url {
                        
                        let displayString = "Name: \(name) \nDescription: \(description) \nFork Count: \(forkcount) \nURL: \(url)"
                        
                        self.showLoader(show: false)
                        self.setDisplayString(displayString: displayString)
                    }
                }
                else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    func showLoader(show:Bool) {
        if show == true {
            loader.startAnimating()
        }
        else {
            loader.hidesWhenStopped = true
            loader.stopAnimating()
        }
    }
    
    func setDisplayString(displayString:String) {
        displayInfo.text = displayString
    }
}