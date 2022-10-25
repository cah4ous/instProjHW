//
//  StoriesCollectionViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 25.10.2022.
//

import UIKit

/// Ячейка сторисов
class StoriesCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet var newLabe: UILabel!

    // MARK: - Public Methods
    func refresh() {
        newLabe.text = "123"
    }
}
