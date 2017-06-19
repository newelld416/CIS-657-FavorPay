//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit

class FavorPayViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dismiss keyboard when tapping outside oftext fields
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard)))
    }
    
    func dismissKeyboard() { self.view.endEditing(true) }
}

