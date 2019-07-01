//
//  BreedProviderMock.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class BreedProviderMock: BreedProvider {
    var callsToAvailableBreed = 0

    func breed() throws -> Breed? {
        self.callsToAvailableBreed += 1

        return Breed.validBreed
    }
}
