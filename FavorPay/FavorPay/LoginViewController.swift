//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: FavorPayViewController {

    @IBOutlet weak var email: FavorPayTextField!
    @IBOutlet weak var password: FavorPayTextField!
    
    @IBAction func login(_ sender: FavorPayButton) {
        if let email = self.email.text, let password = self.password.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let _ = error {
                    print(error?.localizedDescription ?? "")
                    return
                } else {
                    print("Successful Login")
                }
            }
        } else {
            print("Error 2")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

