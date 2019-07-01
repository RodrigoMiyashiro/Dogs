//
//  SessionWriter.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol SessionWriter: AnyObject {
    func persistToken(_ token: String?) throws
    func loadToken() throws -> String?
}
