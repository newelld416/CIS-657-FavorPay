//
//  ViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 5/27/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GooglePlacePicker

class RequestViewController: FavorPayViewController, LocationSearchViewControllerDelegate {
    
    @IBOutlet weak var deedTitle: FavorPayTextField!
    @IBOutlet weak var points: FavorPayTextField!
    @IBOutlet weak var desc: FavorPayTextView!
    
    @IBOutlet weak var eventLocationLabel: FavorPayLabel!
    @IBOutlet weak var eventDateLabel: FavorPayLabel!
    
    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    var selectedPoint: Int = 0
    var eventTime: Date = Date()
    var deedLocation: GMSPlace?
    
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
    
    func clear() {
        self.deedTitle.text = ""
        self.points.text = ""
        self.desc.text = ""
        self.eventLocationLabel.text = "Set Your Event Location"
        self.eventDateLabel.text = "Set You Event Date"
    }
    
    func saveEntry() {
        let longitude: Double = (deedLocation?.coordinate.longitude)!
        let latitude: Double = (deedLocation?.coordinate.latitude)!
        let entry = GoodDeed(
            id: UUID().uuidString,
            title: String(deedTitle.text!)!,
            desc: String(desc.text!)!,
            points: Int(points.text!)!,
            timeStamp: eventTime.description,
            longitude: String(longitude),
            latitude: String(latitude),
            formattedAddress: (deedLocation?.formattedAddress)!
        )
        let newChild = self.ref?.child("goodDeed").childByAutoId()
        newChild?.setValue(self.toDictionary(vals: entry))
        self.clear()
    }
    
    @IBAction func submitRequest(_ sender: FavorPayButton) {
        saveEntry()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ref = Database.database().reference()
        self.clear()
    }
    
    override func didReceiveMemoryWarning() { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationSearchViewController = segue.destination as? LocationSearchViewController {
            if segue.identifier == "locationSegue" {
                locationSearchViewController.delegate = self
            }
        }
    }
    
    func setDateAndLocation(date: Date, location: GMSPlace) {
        self.eventLocationLabel.text = date.description
        self.deedLocation = location
        self.eventDateLabel.text = location.formattedAddress
    }
}
