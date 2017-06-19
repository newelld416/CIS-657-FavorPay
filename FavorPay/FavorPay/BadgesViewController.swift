//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GooglePlaces

class BadgesViewController: FavorPayViewController {
    
    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    var totalPointsValue = 0
    
    var delegate: BadgesViewControllerDelegate?
    
    @IBOutlet weak var totalPoints: FavorPayLabel!
    
    fileprivate func registerForFireBaseUpdates() {
        let user = Auth.auth().currentUser
        if user != nil {
            self.ref!.child((user?.uid)!).observe(.value, with: {
                snapshot in if let postDict = snapshot.value as? [String : AnyObject] {
                    var tmpItems = [GoodDeed]()
                    for (_,val) in postDict.enumerated() {
                        let entry = val.1 as! Dictionary<String,AnyObject>
                        tmpItems.append(
                            GoodDeed(
                                id: entry["id"] as! String,
                                title: entry["title"] as! String,
                                desc: entry["desc"] as! String,
                                points: entry["points"] as! Int,
                                timeStamp: entry["timeStamp"] as! String,
                                longitude: entry["longitude"] as! String,
                                latitude: entry["latitude"] as! String,
                                formattedAddress: entry["formattedAddress"] as! String
                            )
                        )
                    }
                    self.entries = tmpItems
                    
                    self.totalPointsValue = 0
                    for i in 0 ..< self.entries.count {
                        self.totalPointsValue += self.entries[i].points
                    }
                    
                    self.totalPoints.text = "Total Points: \(self.totalPointsValue)"
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
        
    }
    
    @IBAction func Badge1Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 1) } }
    @IBAction func Badge2Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 2) } }
    @IBAction func Badge3Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 3) } }
    @IBAction func Badge4Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 4) } }
    @IBAction func Badge5Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 5) } }
    @IBAction func Badge6Clicked(_ sender: FavorPayButton) { if let d = self.delegate { d.setBadgeDate(badge: 6) } }
}

protocol BadgesViewControllerDelegate {
    func setBadgeDate(badge: Int)
}



