//
//  SignUpViewController.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

final class SignUpViewController: BaseConfigurationViewController, SignUpScreen {
    private var presenter: SignUpPresenter?
    
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
    }
    
    @IBAction func registerEmail(_ sender: Any) {
        self.signUp()
    }
    
    internal func signUp() {
        self.signupEmailTextField.resignFirstResponder()
        self.startActivityIndicator()
        
        guard let email = self.signupEmailTextField.text, email.isEmail else {
            self.showAlert(withMessage: "Digite um e-mail válido.")
            return
        }

        self.presenter = SignUpPresenter(screen: self)
        self.presenter?.executeSignUp(withEmail: email)
    }
    
    func signUpPerformedSuccessful(_ user: User?) {
        self.stopActivityIndicator()
        self.openBreedSummary()
    }
    
    func showErrorPerformingSignUp() {
        self.showAlert(withMessage: "Não foi possível fazer o cadastro no momento. Tente novamente mais tarde.")
        self.stopActivityIndicator()
    }
}
