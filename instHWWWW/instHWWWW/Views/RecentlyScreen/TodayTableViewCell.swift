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
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public Methods
    
    func refresh(_ model: Recently) {
         avatarPersonImageView.image = UIImage(named: model.profileImageName)

        likeLabel.attributedText = NSMutableAttributedString()
            .bold("\(model.profileImageName) ")
            .normal("\(model.commentText) ")
            .grayTextColor(" \(model.timeText)")
        postImageView.image = UIImage(named: model.imageName)
        if model.isSub {
            subscribeButton.isHidden = false
            postImageView.isHidden = true
        } else {
            subscribeButton.isHidden = true
            postImageView.isHidden = false
        }
     }
}
