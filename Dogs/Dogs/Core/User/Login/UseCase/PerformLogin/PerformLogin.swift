//
//  PerformLogin.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class PerformLogin: ParameterizedUseCase {
    typealias Parameters = String

    private let provider: PerformLoginProvider
    private let receiver: PerformLoginReceiver

    init(provider: PerformLoginProvider, receiver: PerformLoginReceiver) {
        self.provider = provider
        self.receiver = receiver
    }

    func execute(with parameters: PerformLogin.Parameters) {
        do {
            let user = try self.provider.login(with: parameters)

            self.receiver.finishLoginSuccessfully(user)
        } catch {
            self.receiver.handleLoginFailure()
        }
    }
}
