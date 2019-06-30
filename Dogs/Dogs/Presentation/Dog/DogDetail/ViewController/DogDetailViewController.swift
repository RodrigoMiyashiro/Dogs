//
//  DogDetailViewController.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class DogDetailViewController: UIViewController, DogDetailDestinationScreen {
    var deliveryDogImage: UIImage?
    var deliveryBreedName: String?
    var imageView: ImageZoomView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialiazer()
    }

    private func initialiazer() {
        self.configureTitle()
        self.configureImageView()
    }

    private func configureTitle() {
        self.title = self.deliveryBreedName
    }

    private func configureImageView() {
        guard let image = self.deliveryDogImage else {
            return
        }

        self.imageView = ImageZoomView(frame: self.view.frame, image: image)
        self.view.addSubview(self.imageView)
    }
}
