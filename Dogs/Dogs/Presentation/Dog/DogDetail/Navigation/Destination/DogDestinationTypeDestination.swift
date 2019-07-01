//
//  DogDestinationTypeDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DogDetailTypeDestination: Destination {
    var viewController: UIViewController {
        get {
            return self.initialViewController(ofStoryboard: "DogDetailStoryboard")
        }
    }
}
