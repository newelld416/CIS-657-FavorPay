//
//  BadgesDetailViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 6/17/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit

class BadgesDetailViewController: FavorPayViewController, BadgesViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Populate the location entries in the history table view controller
        if let badgeViewController = segue.destination as? BadgesViewController {
            if segue.identifier == "badgeDetailSegue" {
                badgeViewController.delegate = self
            }
        }
    }
    
    func setBadgeDate(badge: Int) {
        print("Success: \(badge)")
    }
}
