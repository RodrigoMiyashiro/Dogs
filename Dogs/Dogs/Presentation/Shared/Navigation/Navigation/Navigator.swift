//
//  Navigator.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

protocol Navigator {
    func navigate(to destination: Destination, mode: NavigationMode)
    func navigate(to destination: Destination, mode: NavigationMode, effect: NavigationEffect)
    func set(current: UIViewController)
}
