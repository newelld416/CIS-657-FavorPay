//
//  FavorPayButton.swift
//  FavorPayApp
//

import UIKit

class FavorPayButton: UIButton {
    
    override func awakeFromNib() {
        self.backgroundColor = THEME_COLOR3
        self.tintColor = THEME_COLOR2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR3.cgColor
        self.layer.cornerRadius = 5.0
        self.layoutMargins.top = 8
        self.layoutMargins.bottom = 8
    }
}


