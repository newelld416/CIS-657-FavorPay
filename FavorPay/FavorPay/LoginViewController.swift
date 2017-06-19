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
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func login(_ sender: FavorPayButton) {
        self.errorLabel.isHidden = true
        if let email = self.email.text, let password = self.password.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let _ = error {
                    print(error ?? "")
                    self.errorLabel.isHidden = false
                    return
                } else {
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }
            }
        } else {
            print("There was an error loggin in")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.email.text = ""
        self.password.text = ""
        self.errorLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

