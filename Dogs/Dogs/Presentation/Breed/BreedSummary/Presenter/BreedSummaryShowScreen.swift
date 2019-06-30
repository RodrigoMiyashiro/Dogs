//
//  BreedSummaryShowScreen.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

protocol BreedSummaryShowScreen: AnyObject {
    func displayableBreeds(_ breeds: [Breed])

    func showErrorObtainingBreeds()
}
