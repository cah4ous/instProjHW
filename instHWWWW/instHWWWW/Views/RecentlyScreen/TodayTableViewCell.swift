//
//  TodayTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 21.10.2022.
//

import UIKit

/// Настройка ячейки "сегодня"
final class TodayTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private var avatarPersonImageView: UIImageView!
    
    @IBOutlet private var postImageView: UIImageView!
    
    @IBOutlet private var subscribeButton: UIButton!
    
    @IBOutlet private var likeLabel: UILabel!
    
    // MARK: - Public Methods
    
    func refresh(_ person: Recently) {
         avatarPersonImageView.image = UIImage(named: person.profileImageName)

        likeLabel.attributedText = NSMutableAttributedString()
            .bold("\(person.profileImageName) ")
            .normal("\(person.commentText) ")
            .grayTextColor(" \(person.timeText)")
        postImageView.image = UIImage(named: person.imageName)
        if person.isSub {
            subscribeButton.isHidden = false
            postImageView.isHidden = true
        } else {
            subscribeButton.isHidden = true
            postImageView.isHidden = false
        }
     }
}
