//
//  HTTPError.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

enum HTTPError: Error {
    case requestError(_ message: String)
}
