//
//  DefaultSessionWriteExecutor.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultSessionWriterExecutor: SessionWriterExecutor {
    private let sessionWriter: DefaultTokenPersistence
    private let listener: SessionWriterListener

    init(listener: SessionWriterListener) {
        self.listener = listener
        self.sessionWriter = DefaultTokenPersistence()
    }

    func performSaveToken(_ token: String?) throws {
        do {
            self.sessionWriter.deleteTable()
            try self.sessionWriter.persistToken(token)
        } catch {
            self.listener.dealWithTokenSavedFailure()
        }
    }
}
