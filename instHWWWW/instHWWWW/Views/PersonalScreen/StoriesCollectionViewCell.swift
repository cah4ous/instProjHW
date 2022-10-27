//
//  StoriesCollectionViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 25.10.2022.
//

import UIKit

/// Ячейка сторисов
final class StoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlet
    @IBOutlet private var newLabel: UILabel!
    
    @IBOutlet private var storiesImageView: UIImageView!
    
    // MARK: - Public Properties
    func refresh(_ stories: Stories) {
         storiesImageView.image = UIImage(named: stories.imageName ?? "")
         newLabel.text = stories.name ?? ""
     }
}
