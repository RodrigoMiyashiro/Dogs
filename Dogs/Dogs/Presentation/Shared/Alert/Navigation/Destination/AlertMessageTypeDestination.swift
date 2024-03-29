//
//  AlertMessageTypeDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class AlertMessageTypeDestination: Destination {
    private var title: String
    private var message: String
    private var buttonTitle: String

    var viewController: UIViewController {
        get {
            let alertController = UIAlertController(title: self.title,
                                                    message: self.message,
                                                    preferredStyle: UIAlertController.Style.alert)
            let actionButton = UIAlertAction(title: self.buttonTitle,
                                             style: UIAlertAction.Style.default,
                                             handler: nil)

            alertController.addAction(actionButton)

            return alertController
        }
    }

    init(title: String, message: String, buttonTitle: String) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
}
