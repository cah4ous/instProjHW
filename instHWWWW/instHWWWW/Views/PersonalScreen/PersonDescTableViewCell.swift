//
//  PersonDescTableViewCell.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 24.10.2022.
//

import UIKit

/// Ячейка дополнительной информации
class PersonDescTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    private enum Constants {
        static let defaultGray = "defaultGray"
    }
    
    // MARK: - IBOutlet
    @IBOutlet private var downChevronButton: UIButton!
    @IBOutlet private var sendMessageButton: UIButton!
    
    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        settingsSubButton(button: downChevronButton)
        settingsSubButton(button: sendMessageButton)
    }
    
    // MARK: - Private Methods
    private func settingsSubButton(button: UIButton) {
        button.layer.borderColor = UIColor(named: Constants.defaultGray)?.cgColor
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1.0
    }
    
}
