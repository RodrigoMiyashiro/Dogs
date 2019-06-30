//
//  SessionWriterError.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

enum SessionWriterError: Error {
    case errorSavingToken
    case errorEntityNotFound
    case errorObtainingTokenSaved
    case errorConvertingToString
}
