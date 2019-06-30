//
//  Dog.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Dog: Codable {
    var url: String?

    private enum CodingKeys: String, CodingKey {
        case url = ""
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.url = try? container.decode(String.self)
    }
}
