//
//  PostTableViewCell.swift
//  InstProjectHW
//
//  Created by Александр Троицкий on 19.10.2022.
//

import UIKit

/// Ячейка постов
final class PostTableViewCell: UITableViewCell {
    
    @IBOutlet private var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
