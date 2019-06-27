//
//  PerformLoginTest.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class PerformLoginTest: XCTestCase {
    let user = User.validUser
    var receiverMock: PerformLoginReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiverMock = PerformLoginReceiverMock()
    }

    override func tearDown() {
        self.receiverMock = nil

        super.tearDown()
    }

    func testPerformLoginSuccessfully() {
        let providerMock = PerformLoginProviderMock()
        let performLogin = PerformLogin(provider: providerMock, receiver: self.receiverMock!)

        performLogin.execute(with: self.user.profile.email)

        XCTAssert(providerMock.callsToHandleAvailablePerformLogin == 1,
                  "There should be at least 1 call to provider's available perform login")
        XCTAssert(self.receiverMock?.callsToHandleSuccessfullyPerformLogin == 1,
                  "There should be at least 1 call to receiver's main method - Successfully")
    }

    func testPerformLoginFailure() {
        let providerMock = PerformLoginProviderMockForFailure()
        let performLogin = PerformLogin(provider: providerMock, receiver: self.receiverMock!)

        performLogin.execute(with: self.user.profile.email)

        XCTAssert(providerMock.callsToAvailablePerformLogin == 1,
                  "There should be at least 1 call to provider's available perform login")
        XCTAssert(self.receiverMock?.callsToHandleErrorPerformLogin == 1,
                  "There should be at least 1 call to receiver's main method - Failure")
    }
}
