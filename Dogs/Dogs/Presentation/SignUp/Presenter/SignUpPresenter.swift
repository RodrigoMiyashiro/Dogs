//
//  SignUpPresenter.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class SignUpPresenter: PerformLoginListener {
    unowned let screen: SignUpScreen
    private var executor: PerformLoginExecutor?

    init(screen: SignUpScreen) {
        self.screen = screen
    }

    func executeSignUp(withEmail email: String) {
        self.executor = DefaultPerformLoginExecutor(listener: self)
        self.executor?.performLogin(email)
    }

    func dealWithSuccessfulLogin(_ user: User?) {
        self.screen.signUpPerformedSuccessful(user)
    }

    func dealWithFailingLogin() {
        self.screen.showErrorPerformingSignUp()
    }
}
