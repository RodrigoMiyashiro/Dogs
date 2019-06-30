//
//  ObtainAllBreedsExecutor.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol ObtainAllBreedsExecutor: AnyObject {
    func obtainAllBreeds(_ categories: [BreedType]) throws -> [Breed]
}
