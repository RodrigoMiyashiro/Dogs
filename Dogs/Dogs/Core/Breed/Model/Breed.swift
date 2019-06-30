//
//  Breed.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

struct Breed: Codable {
    var category: String
    var dogs: [Dog]
    
    private enum CodingKeys: String, CodingKey {
        case category
        case dogs = "list"
    }
}
