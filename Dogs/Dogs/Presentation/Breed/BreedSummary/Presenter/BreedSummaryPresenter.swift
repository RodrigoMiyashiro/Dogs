//
//  BreedSummaryPresenter.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class BreedSummaryPresenter {
    unowned let screen: BreedSummaryShowScreen
    unowned let executor: ObtainAllBreedsExecutor
    
    init(screen: BreedSummaryShowScreen, executor: ObtainAllBreedsExecutor) {
        self.screen = screen
        self.executor = executor
    }
    
    func retrieveBreeds() {
        do {
            let breeds = try self.executor.obtainAllBreeds([.hound,.husky,.labrador,.pug])
            
            self.screen.displayableBreeds(breeds)
        } catch {
            self.screen.showErrorObtainingBreeds()
        }
    }
}
