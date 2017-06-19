//
//  BankViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 6/19/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GooglePlaces

class BankViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    
    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    
    fileprivate func registerForFireBaseUpdates() {
        let user = Auth.auth().currentUser
        if user != nil {
            self.ref!.child((user?.uid)!).observe(.value, with: {
                snapshot in if let postDict = snapshot.value as? [String : AnyObject] {
                    var points = 0
                    for (_,val) in postDict.enumerated() {
                        let entry = val.1 as! Dictionary<String,AnyObject>
                        points += entry["points"] as! Int
                    }
                    self.pointsLabel.text = "You have earned \(points) points"
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        self.registerForFireBaseUpdates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
