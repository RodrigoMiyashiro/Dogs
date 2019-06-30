//
//  DefaultSessionReaderExecutor.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultSessionReaderExecutor: SessionReaderExecutor {
    private let sessionReader: DefaultTokenPersistence
    private let receiver: SessionReaderReceiver

    init(receiver: SessionReaderReceiver) {
        self.receiver = receiver
        self.sessionReader = DefaultTokenPersistence()
    }

    func performLoadToken() {
        do {
            let token = try self.sessionReader.loadToken()

            self.receiver.dealWithTokenLoadedSuccessfully(token)
        } catch {
            self.receiver.dealWithTokenLoadedFailure()
        }
    }
}
