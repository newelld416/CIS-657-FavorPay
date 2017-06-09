//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit

class SearchViewController: FavorPayViewController, UITableViewDelegate, UITableViewDataSource {
    
    var goodDeeds: [GoodDeed] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goodDeeds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! FavorPayTableViewCell
        
        cell.title.text = self.goodDeeds[indexPath.row].title
        cell.desc.text = self.goodDeeds[indexPath.row].desc
        cell.points.text = String(self.goodDeeds[indexPath.row].points)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This is a mock of good deeds for testing
        for i in 1...50 {
            goodDeeds.append(GoodDeed(id: "\(i)", title: "Text\(i)", location: "", desc: "This is my \(i) Description", points: 150))
        }
    }
}
