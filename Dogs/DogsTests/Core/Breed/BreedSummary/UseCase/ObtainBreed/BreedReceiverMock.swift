//
//  BreedReceiverMock.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class BreedReceiverMock: BreedReceiver {
    var callsToReceiverBreed = 0
    var callsToHandleErrorObtainingBreed = 0

    var obtainBreed: Breed?

    func receiveBreed(_ breed: Breed?) {
        self.callsToReceiverBreed += 1

        self.obtainBreed = breed
    }
    
    func handleErrorObtainingBreed() {
        self.callsToHandleErrorObtainingBreed += 1
    }
}
