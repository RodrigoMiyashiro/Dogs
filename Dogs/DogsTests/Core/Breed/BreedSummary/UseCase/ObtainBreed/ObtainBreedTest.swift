//
//  ObtainBreedTest.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ObtainBreedTest: XCTestCase {
    var receiver: BreedReceiverMock?

    override func setUp() {
        super.setUp()

        self.receiver = BreedReceiverMock()
    }

    override func tearDown() {
        self.receiver = nil

        super.tearDown()
    }

    func testObtainBreedSuccessfully() {
        let providerMock = BreedProviderMock()
        let obtainBreed = ObtainBreed(provider: providerMock, receiver: self.receiver!)

        obtainBreed.execute()

        XCTAssert(providerMock.callsToAvailableBreed == 1,
                  "There should be at least 1 call to provider's available obtain breed")
        XCTAssert(self.receiver?.callsToReceiverBreed == 1,
                  "There should be at least 1 call to receiver's main method - Successfully")
    }

    func testObtainBreedFailure() {
        let providerMock = BreedProviderMockForFailure()
        let obtainBreed = ObtainBreed(provider: providerMock, receiver: self.receiver!)

        obtainBreed.execute()

        XCTAssert(providerMock.callsToAvailableBreed == 1,
                  "There should be at least 1 call to provider's available obtain breed")
        XCTAssert(self.receiver?.callsToHandleErrorObtainingBreed == 1,
                  "There should be at least 1 call to receiver's main method - Failure")
    }
}
