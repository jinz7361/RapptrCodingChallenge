//
//  menuButton.swift
//  Rapptr iOS Test
//
//  Created by Jin on 12/16/21.
//

import UIKit

class menuButton: UIButton {
    var title: String
    var imageName: String
    
    let imagePaddingLeft = 22.0
    let imagePaddingTopBottom = 15.5
    let textPaddingLeft = 16.0
    
    required init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = constants.menuButtonCornerRadius
        self.backgroundColor = constants.menuButtonBackgroundColor
        self.titleLabel?.font = constants.menuButtonTextFont
        self.setTitleColor(constants.menuButtonTextColor, for: .normal)
        
        self.setTitle(title, for: .normal)
        if imageName != "" {
            self.setImage(UIImage(named: imageName), for: .normal)
        }
        
        self.contentHorizontalAlignment = .left
        self.heightAnchor.constraint(equalToConstant: constants.menuButtonHeight).isActive = true
        self.imageEdgeInsets = UIEdgeInsets(top: imagePaddingTopBottom, left: imagePaddingLeft, bottom: imagePaddingTopBottom, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: textPaddingLeft + imagePaddingLeft, bottom: 0, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
