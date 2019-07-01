//
//  BreeSummaryViewControllerNavigationBehavior.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension BreedSummaryViewController {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")

        self.present(destination.viewController, animated: true, completion: nil)
    }
    
    func openDogDetail(_ dogImage: UIImage?, nameBreed: String?) {
        let destination = DogDetailDestination(deliveryDogImage: dogImage, deliveryBreedName: nameBreed)

        self.navigator?.set(current: self)
        self.navigator?.navigate(to: destination,
                                 mode: .fromCurrent)
    }
}
