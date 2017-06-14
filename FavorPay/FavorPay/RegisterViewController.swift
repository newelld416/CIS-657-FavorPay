//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: FavorPayViewController {
    
    @IBOutlet weak var email: FavorPayTextField!
    @IBOutlet weak var password: FavorPayTextField!
    @IBOutlet weak var passwordConfirm: FavorPayTextField!
    
    @IBAction func createUser(_ sender: FavorPayButton) {
        
        if let email = self.email.text {
            let password = self.password.text!
            if self.password.text == self.passwordConfirm.text {
                // [START create_user]
                Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                    if let _ = error {
                        print(error?.localizedDescription ?? "")
                        return
                    } else {
                        //Successfully created a user
                        print("\(user!.email!) created")
                    }
                }
            } else {
                print("There was an error with your password")
            }
        } else {
            print("There was an error with your email")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

