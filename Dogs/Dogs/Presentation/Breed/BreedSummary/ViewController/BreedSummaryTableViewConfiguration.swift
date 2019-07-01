//
//  BreedSummaryTableViewConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let zeroSections: Int = 0
private let onlyOneRow: Int = 1
private let heightForHeaderSection: CGFloat = CGFloat(35)
private let heightForFooterSection: CGFloat = CGFloat(10)

extension BreedSummaryViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let breeds = self.breeds else {
            return zeroSections
        }

        return breeds.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onlyOneRow
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "breedSummaryTableViewCell"
        guard let cell = self.breedSummaryTableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                                        for: indexPath) as? BreedSummaryTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? BreedSummaryTableViewCell else {
            return
        }

        let section = indexPath.section
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self,
                                                          forSection: section)
        tableViewCell.collectionViewOffset = self.storedOffsets[section] ?? 0
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? BreedSummaryTableViewCell else {
            return
        }

        let section = indexPath.section
        self.storedOffsets[section] = tableViewCell.collectionViewOffset
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let breeds = self.breeds else {
            return nil
        }

        let breed = breeds[section]
        return breed.category
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderSection
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return heightForFooterSection
    }
}
