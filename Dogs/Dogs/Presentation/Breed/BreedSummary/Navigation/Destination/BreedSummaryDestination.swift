//
//  BreedSummaryDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class BreedSummaryDestination: Destination {
    private var createdViewController: UIViewController?

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            let screen = destination.viewController as! UINavigationController

            return screen
        }
    }
}
