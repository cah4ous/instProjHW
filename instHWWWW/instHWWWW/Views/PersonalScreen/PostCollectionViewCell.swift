//
//  PostCollectionViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 25.10.2022.
//

import UIKit

/// Ячейка коллекции поста
final class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet var postImageView: UIImageView!
    
    // MARK: - Public Properties
    func refresh(_ post: Post) {
         postImageView.image = UIImage(named: post.imageName ?? "")
     }
}
