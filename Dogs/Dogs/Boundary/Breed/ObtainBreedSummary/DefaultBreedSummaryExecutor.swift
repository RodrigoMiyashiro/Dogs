//
//  DefaultBreedSummaryExecutor.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultBreedSummaryExecutor: ObtainBreedSummaryExecutor, BreedReceiver {
    let semaphoro = DispatchSemaphore(value: 0)

    private var isSuccess = false
    private var obtainedBreed: Breed?

    func obtainBreedSummary(_ breed: BreedType) throws -> Breed {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultBreedSummaryProvider(client: clientHTTP)
        let obtainBreed = ObtainBreed(provider: provider, receiver: self)

        let parameter: ObtainBreed.Parameters = breed.rawValue
        obtainBreed.execute(with: parameter)

        self.semaphoro.wait()

        guard let obtainedBreed = self.obtainedBreed, self.isSuccess else {
            throw ObtainBreedSummaryExecutorError.errorObtainingBreedSummary
        }

        return obtainedBreed
    }

    func receiveBreed(_ breed: Breed?) {
        self.obtainedBreed = breed

        self.resumeExecution(success: true)
    }

    func handleErrorObtainingBreed() {
        self.resumeExecution(success: false)
    }

    private func resumeExecution(success: Bool) {
        self.isSuccess = success
        self.semaphoro.signal()
    }
}
