//
//  PersonPostTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

/// Ячейка постов тейблвью
final class PersonPostTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let cellIdentifier = "PostCollectionViewCell"
        static let postImageName = "Photo"
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Private Properties
    var postHistory: [Post] = []
    
    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        initMethods()
    }

    // MARK: - Private methods
    private func initMethods() {
        setupUI()
        createPosts()
    }
    private func setPost(newImageName: String) {
        var post = Post()
        post.imageName = newImageName
        
        postHistory.append(post)
    }
    
    private func createPosts() {
        setPost(newImageName: Constants.postImageName)
        setPost(newImageName: Constants.postImageName)
    }
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
        return postHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.cellIdentifier,
            for: indexPath) as? PostCollectionViewCell {
            let post = postHistory[indexPath.row]
            itemCell.refresh(post)
            
            return itemCell
        }
        return UICollectionViewCell()
    }
}
