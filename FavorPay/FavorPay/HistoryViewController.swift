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

class HistoryViewController: UITableViewController {
    
    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    
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
                    self.tableView.reloadData()
                }
            })
        }
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
        //This is view only so do nothin when row is selected
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
}
