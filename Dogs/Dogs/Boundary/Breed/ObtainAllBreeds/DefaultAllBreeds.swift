//
//  DefaultAllBreeds.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultAllBreeds: ObtainAllBreedsExecutor {
    unowned let executor: ObtainBreedSummaryExecutor
    
    init(executor: ObtainBreedSummaryExecutor) {
        self.executor = executor
    }
    
    func obtainAllBreeds(_ categories: [BreedType]) throws -> [Breed] {
        var listBreeds = [Breed]()
        
        for category in categories {
            do {
                let breed = try self.executor.obtainBreedSummary(category)
                listBreeds.append(breed)
            } catch {
                throw ObtainAllBreedsExecutorError.errorObtainingAllBreeds
            }
        }
        
        return listBreeds
    }
}
