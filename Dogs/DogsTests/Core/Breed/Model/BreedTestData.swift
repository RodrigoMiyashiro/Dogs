//
//  BreedTestData.swift
//  DogsTests
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import  UIKit

extension Breed {
    static var validBreed: Breed {
        let breed: Breed? = ParseForMock().parseData(fileName: "BreedDataTest", ofType: "json")
        
        return breed!
    }
}
