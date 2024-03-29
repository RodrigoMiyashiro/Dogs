//
//  AlertMessageDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class AlertMessageDestination: Destination {
    private var createdViewController: UIViewController?
    private var title: String
    private var message: String
    private var buttonTitle: String

    var viewController: UIViewController {
        get {
            if let existingViewController = self.createdViewController {
                return existingViewController
            }
            
            let destination = self.destinationBuilder(title: self.title,
                                                      message: self.message,
                                                      buttonTitle: self.buttonTitle)
            let screen = destination.viewController as! UIAlertController

            return screen
        }
    }
    
    init(title: String, message: String, buttonTitle: String) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
}
