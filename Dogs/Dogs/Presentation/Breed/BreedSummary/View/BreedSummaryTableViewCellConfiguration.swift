//
//  BreedSummaryTableViewCellConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

extension BreedSummaryTableViewCell {
    func setCollectionViewDataSourceDelegate<deleg: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: deleg, forSection section: Int) {
        self.breedSummaryCollectionView.dataSource = dataSourceDelegate
        self.breedSummaryCollectionView.delegate = dataSourceDelegate
        self.breedSummaryCollectionView.tag = section
        self.breedSummaryCollectionView.setContentOffset(self.breedSummaryCollectionView.contentOffset,
                                                         animated: false)
        self.breedSummaryCollectionView.reloadData()
    }

    var collectionViewOffset: CGFloat {
        set {
            self.breedSummaryCollectionView.contentOffset.x = newValue
        }
        get {
            return self.breedSummaryCollectionView.contentOffset.x
        }
    }
}
