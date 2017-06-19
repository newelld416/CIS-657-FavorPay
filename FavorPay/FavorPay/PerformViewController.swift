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
import Firebase
import GooglePlacePicker

class PerformViewController: UITableViewController {
    
    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    var myGoodDeeds : [GoodDeed] = []
    
    func toDictionary(vals: GoodDeed) -> NSDictionary {
        return [
            "id" : vals.id,
            "title" : vals.title,
            "desc" : vals.desc,
            "points" : vals.points,
            "timeStamp" : vals.timeStamp,
            "longitude" : vals.longitude,
            "latitude" : vals.latitude,
            "formattedAddress" : vals.formattedAddress
        ]
    }
    
    fileprivate func registerForFireBaseUpdates() {
        self.ref!.child("goodDeed").observe(.value, with: {
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
                self.tableView.reloadData()
            }
        })
        
        let user = Auth.auth().currentUser
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
                self.myGoodDeeds = tmpItems
            }
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        self.registerForFireBaseUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.entries.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goodDeed = self.entries[indexPath.row] as GoodDeed
        let uiAlert = UIAlertController(title: goodDeed.title, message: "Are you sure you want to perform this good deed?", preferredStyle: UIAlertControllerStyle.alert)
        self.present(uiAlert, animated: true, completion: nil)
        uiAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in self.performGoodDeed(goodDeed: goodDeed) }))
        uiAlert.addAction(UIAlertAction(title: "Nope", style: .cancel, handler: nil))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "goodDeedCell", for: indexPath) as! FavorPayTableViewCell
        
        cell.title.text = self.entries[indexPath.row].title
        cell.desc.text = self.entries[indexPath.row].desc
        cell.points.text = String(self.entries[indexPath.row].points)
        
        return cell
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Hide the keyboard when the user taps outside the text fields
        self.view.endEditing(true)
    }
    
    func performGoodDeed(goodDeed: GoodDeed) {
        var goodDeedPerformed = false
        let user = Auth.auth().currentUser
        for i in 0 ..< self.myGoodDeeds.count {
            if (self.myGoodDeeds[i].id == goodDeed.id) {
                goodDeedPerformed = true
            }
        }
        
        if (user != nil) {
            if (goodDeedPerformed != true) {
                let entry = GoodDeed(
                    id: goodDeed.id,
                    title: goodDeed.title,
                    desc: goodDeed.desc,
                    points: goodDeed.points,
                    timeStamp: goodDeed.timeStamp,
                    longitude: goodDeed.longitude,
                    latitude: goodDeed.latitude,
                    formattedAddress: goodDeed.formattedAddress
                )
                let newChild = self.ref?.child((user?.uid)!).childByAutoId()
                newChild?.setValue(self.toDictionary(vals: entry))
            } else {
                let message = "You have already performed this Good Deed"
                let uiAlert = UIAlertController(title: goodDeed.title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                self.present(uiAlert, animated: true, completion: nil)
                uiAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            }
        }
    }
}
