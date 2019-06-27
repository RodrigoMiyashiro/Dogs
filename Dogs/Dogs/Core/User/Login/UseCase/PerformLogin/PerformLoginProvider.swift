//
//  PerformLoginProvider.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol PerformLoginProvider: AnyObject {
    func login(with email: String) throws -> User?
}
