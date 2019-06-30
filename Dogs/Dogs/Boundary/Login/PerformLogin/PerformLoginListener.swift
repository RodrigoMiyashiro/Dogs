//
//  PerformLoginListener.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PerformLoginListener: AnyObject {
    func dealWithSuccessfulLogin(_ user: User?)

    func dealWithFailingLogin()
}
