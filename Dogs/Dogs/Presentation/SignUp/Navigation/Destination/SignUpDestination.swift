//
//  SignUpDestination.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class SignUpDestination: Destination {
    var viewController: UIViewController {
        get {
            return self.initialViewController(ofStoryboard: "SignUpStoryboard")
        }
    }
}
