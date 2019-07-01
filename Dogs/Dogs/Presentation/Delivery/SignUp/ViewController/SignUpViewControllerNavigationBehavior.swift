//
//  SignUpViewControllerNavigationBehavior.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

extension SignUpViewController {
    func showAlert(withMessage message: String) {
        let destination = AlertMessageDestination(title: "Desculpe... :(",
                                                  message: message,
                                                  buttonTitle: "Ok")

        self.present(destination.viewController, animated: true, completion: nil)
    }

    func openBreedSummary() {
        let destination = BreedSummaryDestination()

        self.navigator?.set(current: self)
        self.navigator?.navigate(to: destination,
                                 mode: .fromCurrent,
                                 effect: .flip)
    }
}
