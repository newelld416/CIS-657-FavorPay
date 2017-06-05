//
//  FavorPayTextField.swift
//  FavorPayApp
//

import UIKit

class FavorPayTextField: UITextField {
    
    override func awakeFromNib() {
        
        self.tintColor = THEME_COLOR3
        self.layer.borderWidth = 1.0
        self.layer.borderColor = THEME_COLOR3.cgColor
        self.layer.cornerRadius = 5.0
        
        self.layoutMargins.top = 8
        self.layoutMargins.bottom = 8
        
        self.textColor = THEME_COLOR3
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSForegroundColorAttributeName :
                THEME_COLOR3])
    }
}

