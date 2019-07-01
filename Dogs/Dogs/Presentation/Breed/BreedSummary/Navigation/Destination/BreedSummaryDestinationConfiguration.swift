//
//  BreedSummaryDestinationConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension BreedSummaryDestination {
    func destinationBuilder() -> Destination {
        return BreedSummaryTypeDestination()
    }
}
