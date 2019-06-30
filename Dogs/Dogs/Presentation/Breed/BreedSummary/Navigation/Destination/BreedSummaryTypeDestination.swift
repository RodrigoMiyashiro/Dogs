//
//  BreedSummaryTypeDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class BreedSummaryTypeDestination: Destination {
    var viewController: UIViewController {
        get {
            return self.initialViewController(ofStoryboard: "BreedSummaryStoryboard")
        }
    }
}
