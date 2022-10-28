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
         static let newsStoriesText = "Новое"
         static let otherStoriesText = "Другое"
         static let storiesImageName = "Pic"
         
     }

     // MARK: - IBOutlets
     @IBOutlet private weak var collectionView: UICollectionView!
     
     // MARK: - Private properties
     var storiesHistory: [Stories] = []
     
     // MARK: - Lifecycle
     override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
         initMethods()
     }

     // MARK: - Private methods
     private func initMethods() {
         setupUI()
         createStories()
     }
     private func createStories() {
         createStorie(newStoriesName: Constants.newsStoriesText, newStoriesImageName: Constants.storiesImageName)
         createStorie(newStoriesName: Constants.otherStoriesText, newStoriesImageName: Constants.storiesImageName)
     }
     
     private func createStorie(newStoriesName: String, newStoriesImageName: String) {
         var storie = Stories()
         storie.imageName = newStoriesImageName
         storie.name = newStoriesName
         
         storiesHistory.append(storie)
     }
     
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
         return storiesHistory.count
     }
     
     func collectionView(_ collectionView: UICollectionView,
                         cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         if let itemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentificator,
             for: indexPath) as? StoriesCollectionViewCell {
             let storie = storiesHistory[indexPath.row]
             itemCell.refresh(storie)
             
             return itemCell
         }
         return UICollectionViewCell()
     }
 }
