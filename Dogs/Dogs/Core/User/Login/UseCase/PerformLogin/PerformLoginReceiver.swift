//
//  PerformLoginReceiver.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PerformLoginReceiver: AnyObject {
    func finishLoginSuccessfully(_ user: User?)

    func handleLoginFailure()
}
