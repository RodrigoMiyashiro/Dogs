//
//  DogDetailDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DogDetailDestination: Destination {
    private let deliveryDogImage: UIImage?
    private let deliveryBreedName: String?
    private var createdViewController: UIViewController?

    init(deliveryDogImage: UIImage?, deliveryBreedName: String?) {
        self.deliveryDogImage = deliveryDogImage
        self.deliveryBreedName = deliveryBreedName
    }

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }

            let destination = self.destinationBuilder()
            var screen = destination.viewController as! DogDetailDestinationScreen
            
            screen.deliveryDogImage = self.deliveryDogImage
            screen.deliveryBreedName = self.deliveryBreedName

            return screen as! UIViewController
        }
    }
}
