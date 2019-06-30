//
//  ParseForMockTest.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import XCTest

class ParseForMockTest: XCTestCase {
    func testObtainUserForMock() {
        let user: User? = ParseForMock().parseData(fileName: "UserDataTest", ofType: "json")

        XCTAssert(user != nil, "It's an user.")
    }

    func testObtainBreedForMock() {
        let breed: Breed? = ParseForMock().parseData(fileName: "BreedDataTest", ofType: "json")
        
        XCTAssert(breed != nil, "It's a breed.")
    }
}
