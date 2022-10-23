//
//  NS.swift
//  instHWWWW
//
//  Created by Александр Троицкий on 22.10.2022.
//

import UIKit

// MARK: - Constants
private enum Fonts {
    static let AvenirNextTextBold = "AvenirNext-Bold"
    static let AvenirNextTextRegular = "SF Pro Text-Regular"
}

/// Настройка строки
extension NSMutableAttributedString {
    var fontSize: CGFloat { return 14 }
    var boldFont: UIFont { return UIFont(
        name: Fonts.AvenirNextTextBold, size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
    }
    var normalFont: UIFont { return UIFont(
        name: Fonts.AvenirNextTextRegular, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func bold(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: boldFont
        ]
        
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func normal(_ value: String) -> NSMutableAttributedString {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: normalFont,
        ]
        
        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
    
    func grayTextColor(_ value: String) -> NSMutableAttributedString {

         let attributes: [NSAttributedString.Key: Any] = [
             .font: normalFont,
             .foregroundColor: UIColor.gray,
         ]

        append(NSAttributedString(string: value, attributes: attributes))
        return self
    }
}
