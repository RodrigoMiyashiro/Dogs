//
//  AlertMessageDestinationConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension AlertMessageDestination {
    func destinationBuilder(title: String, message: String, buttonTitle: String) -> Destination {
        return AlertMessageTypeDestination(title: title,
                                           message: message,
                                           buttonTitle: buttonTitle)
    }
}
