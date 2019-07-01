//
//  ObtainBreed.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class ObtainBreed: ParameterizedUseCase {
    typealias Parameters = String
    private let provider: BreedProvider
    private weak var receiver: BreedReceiver?

    init(provider: BreedProvider, receiver: BreedReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: ObtainBreed.Parameters) {
        do {
            let breed = try self.provider.breed(parameters)
            
            self.receiver?.receiveBreed(breed)
        } catch {
            self.receiver?.handleErrorObtainingBreed()
        }
    }
}
