//
//  BasicDestinationBehavior.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension Destination {
    func initialViewController(ofStoryboard storyboardName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let initalViewController = storyboard.instantiateInitialViewController()!

        return initalViewController
    }
}
