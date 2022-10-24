//
//  WeakTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 21.10.2022.
//

import UIKit

/// Настройка ячейки "За эту неделю"
final class WeekTableViewCell: UITableViewCell {
    // MARK: - Constants
    private enum Constants {
        static let grayColor = "defaultGray"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private var subscribeButton: UIButton!
    
    @IBOutlet private var postImageView: UIImageView!
    
    @IBOutlet private var avatarImageView: UIImageView!
    
    @IBOutlet private var infoTextLabel: UILabel!
    
    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingsSubButton()
    }
    
    // MARK: - Public Methods
    func refresh(_ person: Recently) {
        avatarImageView.image = UIImage(named: person.profileImageName)
        infoTextLabel.attributedText = NSMutableAttributedString()
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
    
    // MARK: - Private Methods
    private func settingsSubButton() {
        subscribeButton.layer.borderColor = UIColor(named: Constants.grayColor)?.cgColor
        subscribeButton.layer.borderWidth = 1.0
    }
}
