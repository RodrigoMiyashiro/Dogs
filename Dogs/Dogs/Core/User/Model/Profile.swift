//
//  Profile.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Profile: Codable {
    var email: String
    var id: String
    var token: String
    var createdAt: String
    var updatedAt: String

    private enum CodingKeys: String, CodingKey {
        case email
        case id = "_id"
        case token
        case createdAt
        case updatedAt
    }
}
