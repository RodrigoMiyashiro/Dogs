//
//  BreedSummaryCollectionViewConfiguration.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

private let zeroItems: Int = 0
private let onlyOneSection: Int = 1
private let valueForCalcPositionSectionAndRow: Int = 1000

extension BreedSummaryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return onlyOneSection
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let breeds = self.breeds else {
            return zeroItems
        }

        let breedPosition = collectionView.tag
        let dogs = breeds[breedPosition].dogs
        return dogs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "breedSummaryCollectionViewCell"
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                            for: indexPath) as? BreedSummaryCollectionViewCell else {
            return UICollectionViewCell()
        }

        let dogPosition = indexPath.item
        let breedPosition = collectionView.tag
        let dogs = self.breeds?[breedPosition].dogs
        let dog = dogs?[dogPosition]

        cell.tag = (breedPosition * valueForCalcPositionSectionAndRow) + dogPosition
        cell.setImage(dog?.url)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BreedSummaryCollectionViewCell else {
            return
        }

        guard let breeds = self.breeds else {
            return
        }

        let breedPosition = cell.tag / valueForCalcPositionSectionAndRow
        let breed = breeds[breedPosition]

        self.openDogDetail(cell.dogImageView.image, nameBreed: breed.category)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height

        return CGSize(width: height, height: height)
    }
}
