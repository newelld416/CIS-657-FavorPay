//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit

class PerformViewController: FavorPayViewController, UITableViewDelegate, UITableViewDataSource {
    
    var goodDeeds: [GoodDeed] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goodDeeds.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = goodDeeds[indexPath.row].id
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodDeeds = self.getDefaultGoodDeeds()
        
    }
    
    func getDefaultGoodDeeds() -> [GoodDeed] {
        var goodDeeds: [GoodDeed] = []
        for i in 1...1000 {
            let id = "Test\(i)"
            goodDeeds.append(GoodDeed(id: id, title: "", location: "", description: ""))
        }
        return goodDeeds
    }
}
