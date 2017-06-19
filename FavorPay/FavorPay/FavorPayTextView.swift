//
//  FavorPayTextField.swift
//  FavorPayApp
//

import UIKit

class FavorPayTextView: UITextView {
    
    override func awakeFromNib() {
        
        self.tintColor = THEME_COLOR5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR5.cgColor
        self.layer.cornerRadius = 5.0
        
        self.layoutMargins.top = 8
        self.layoutMargins.bottom = 8
        
        self.textColor = THEME_COLOR5
        self.backgroundColor = THEME_COLOR3
    }
}

