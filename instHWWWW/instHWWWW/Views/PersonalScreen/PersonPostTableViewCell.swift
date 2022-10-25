//
//  PersonPostTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

/// Ячейка постов тейблвью
class PersonPostTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let cellIdentifier = "PostCollectionViewCell"
    }

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Lifecycle
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }

    // MARK: - Private methods
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: Constants.cellIdentifier,
                                      bundle: nil), forCellWithReuseIdentifier: Constants.cellIdentifier)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PersonPostTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath) as? PostCollectionViewCell {
//            itemCell.refresh()
            return itemCell
        }
        return UICollectionViewCell()
    }
}
