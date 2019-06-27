//
//  User.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 26/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct User: Codable {
    var profile: Profile
    
    private enum CodingKeys: String, CodingKey {
        case profile = "user"
    }
}
