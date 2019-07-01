//
//  BreedSummaryViewController.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 28/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class BreedSummaryViewController: BaseConfigurationViewController, BreedSummaryShowScreen {
    private var presenter: BreedSummaryPresenter?
    internal var breeds: [Breed]?
    internal var storedOffsets = [Int: CGFloat]()

    @IBOutlet weak var breedSummaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
        self.loadBreeds()
    }

    func loadBreeds() {
        self.startActivityIndicator()

        let executorBreed = DefaultBreedSummaryExecutor()
        let executorBreeds = DefaultAllBreeds(executor: executorBreed)

        self.presenter = BreedSummaryPresenter(screen: self, executor: executorBreeds)
        self.presenter?.retrieveBreeds()
    }

    func displayableBreeds(_ breeds: [Breed]) {
        self.breeds = breeds
        self.breedSummaryTableView.reloadData()
        self.stopActivityIndicator()
    }
    
    func showErrorObtainingBreeds() {
        self.stopActivityIndicator()
    }
}
