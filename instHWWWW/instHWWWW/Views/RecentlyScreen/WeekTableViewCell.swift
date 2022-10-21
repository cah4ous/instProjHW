//
//  WeakTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 21.10.2022.
//

import UIKit

/// Настройка ячейки "За эту неделю"
final class WeekTableViewCell: UITableViewCell {
    private enum Constants {
        static let grayColor = "defaultGray"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private var subscribeButton: UIButton!
    
    @IBOutlet private var postImageView: UIImageView!
    
    @IBOutlet private var avatarImageView: UIImageView!
    
    @IBOutlet private var infoTextLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingsSubButton()
    }
    
    // MARK: - Public Methods
    func refresh(_ model: Recently) {
        avatarImageView.image = UIImage(named: model.profileImageName)
        infoTextLabel.attributedText = NSMutableAttributedString()
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
    
    // MARK: - Private Methods
    private func settingsSubButton() {
        subscribeButton.layer.borderColor = UIColor(named: Constants.grayColor)?.cgColor
        subscribeButton.layer.borderWidth = 1.0
    }
}
