//
//  SignupViewController.swift
//  SwiftIndiaTDD
//
//  Created by Susmita Horrow on 27/11/17.
//  Copyright © 2017 hsusmita. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
	@IBOutlet var usernameTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var confirmPasswordTextField: UITextField!
	@IBOutlet var submitButton: UIButton!

	var signupModel: SignupViewModel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func usernameEditingChanged(_ sender: Any) {
		signupModel.usernameField.value = usernameTextField.text ?? ""
		submitButton.isEnabled = signupModel.signupForm.isValid()
	}

	@IBAction func passwordEditingChanged(_ sender: Any) {
		signupModel.passwordField.value = passwordTextField.text ?? ""
		submitButton.isEnabled = signupModel.signupForm.isValid()
	}

	@IBAction func confirmPasswordEditingChanged(_ sender: Any) {
		signupModel.confirmPasswordField.value = confirmPasswordTextField.text ?? ""
		submitButton.isEnabled = signupModel.signupForm.isValid()
	}

	@IBAction func submitButtonTapped(_ sender: Any) {
		signupModel.submit()
	}

	/*

	// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
