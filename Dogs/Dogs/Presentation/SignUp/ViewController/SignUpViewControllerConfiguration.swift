//
//  SignUpViewControllerConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension SignUpViewController: UITextFieldDelegate {
    internal func initializer() {
        self.configureRegisterButton()
    }

    internal func configureRegisterButton() {
        self.registerButton.cornerRadius(value: 10.0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.signupEmailTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.signUp()

        return true
    }
}
