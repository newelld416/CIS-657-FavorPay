//
//  FavorPayTextField.swift
//  FavorPayApp
//

import UIKit

class FavorPayTextField: UITextField {
    
    override func awakeFromNib() {
        
        self.tintColor = THEME_COLOR5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR5.cgColor
        self.layer.cornerRadius = 5.0
        
        self.layoutMargins.top = 8
        self.layoutMargins.bottom = 8
        
        self.textColor = THEME_COLOR5
        self.backgroundColor = THEME_COLOR3
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSForegroundColorAttributeName :
                THEME_COLOR5])
    }
}

