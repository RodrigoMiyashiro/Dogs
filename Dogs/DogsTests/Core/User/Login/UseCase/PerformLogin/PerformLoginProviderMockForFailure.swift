//
//  PerformLoginProviderMockForFailure.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PerformLoginProviderMockForFailure: PerformLoginProvider {
    var callsToAvailablePerformLogin = 0

    func login(with email: String) throws -> User? {
        self.callsToAvailablePerformLogin += 1

        throw PerformLoginProviderError.errorPerformingLogin
    }
}
