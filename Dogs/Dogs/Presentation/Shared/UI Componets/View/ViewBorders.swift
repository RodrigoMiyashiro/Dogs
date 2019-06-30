//
//  ViewBorders.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 27/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension UIView {
    func cornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
