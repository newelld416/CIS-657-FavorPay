//
//  FavorPayTabViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 6/13/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseAuth

class FavorPayTabViewController: UITabBarController {

    @IBAction func logout(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
