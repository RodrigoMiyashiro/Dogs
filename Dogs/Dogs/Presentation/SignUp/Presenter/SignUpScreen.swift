//
//  SignUpScreen.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol SignUpScreen: AnyObject {
    func signUpPerformedSuccessful(_ user: User?)

    func showErrorPerformingSignUp()
}
