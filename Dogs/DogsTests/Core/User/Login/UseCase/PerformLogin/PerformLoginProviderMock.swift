//
//  PerformLoginProviderMock.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PerformLoginProviderMock: PerformLoginProvider {
    var callsToHandleAvailablePerformLogin = 0

    func login(with email: String) throws -> User? {
        self.callsToHandleAvailablePerformLogin += 1
        
        return User.validUser
    }
}
