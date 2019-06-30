//
//  BreedSummaryCollectionViewCell.swift
//  Dogs
//
//  Created by Rodrigo Miyashiro on 29/06/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import UIKit

class BreedSummaryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dogImageView: UIImageView!

    func setImage(_ url: String?) {
        let imagePlaceholder = "ic_placeholder"
        self.dogImageView.downloadImage(withURL: url,
                                        placeholder: imagePlaceholder)
    }
}
