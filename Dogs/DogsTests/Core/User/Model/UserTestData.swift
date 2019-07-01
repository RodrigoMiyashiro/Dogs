//
//  UserTestData.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension User {
    static var validUser: User {
        let user: User? = ParseForMock().parseData(fileName: "UserDataTest", ofType: "json")

        return user!
    }
}
