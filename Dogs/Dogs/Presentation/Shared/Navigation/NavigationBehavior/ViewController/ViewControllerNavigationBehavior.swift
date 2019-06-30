//
//  ViewControllerNavigationBehavior.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIViewController {
    var navigator: Navigator? {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)?.navigator
        }
    }
}
