//
//  PersonStoriesTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

// Ячейка сторисов тейблвью
 final class PersonStoriesTableViewCell: UITableViewCell {

     // MARK: - Constants
     private enum Constants {
         static let cellIdentificator = "StoriesCollectionViewCell"
     }

     // MARK: - IBOutlets
     @IBOutlet weak var collectionView: UICollectionView!

     // MARK: - Lifecycle
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
         setupUI()
     }

     // MARK: - Private methods
     private func setupUI() {
         collectionView.delegate = self
         collectionView.dataSource = self
         
         collectionView.register(UINib(nibName: Constants.cellIdentificator,
                                       bundle: nil), forCellWithReuseIdentifier: Constants.cellIdentificator)
     }
 }

 // MARK: - UICollectionViewDelegate, UICollectionViewDataSource
 extension PersonStoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 10
     }
     func collectionView(_ collectionView: UICollectionView,
                         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if let itemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentificator,
             for: indexPath) as? StoriesCollectionViewCell {
             itemCell.refresh()
             return itemCell
         }
         return UICollectionViewCell()
     }
 }
