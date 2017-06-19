//
//  MapViewController.swift
//  FavorPay
//
//  Created by Daniel Newell on 6/16/17.
//  Copyright © 2017 Daniel Newell. All rights reserved.
//

import UIKit
import GoogleMaps
import FirebaseDatabase

class MapViewController: UIViewController {

    fileprivate var ref : DatabaseReference?
    var entries : [GoodDeed] = []
    let mapView = GMSMapView.map(
        withFrame: CGRect.zero,
        camera: GMSCameraPosition.camera(withLatitude: 42.9634, longitude: -85.6681, zoom: 12.0)
    )
    
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
                
                for i in 0 ..< self.entries.count {
                    // Example marker in the center of the map.
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: Double(self.entries[i].latitude)!, longitude: Double(self.entries[i].longitude)!)
                    marker.title = self.entries[i].title
                    marker.map = self.mapView
                }
            }
        })
    }
    
    override func viewDidLoad() {
        
        self.ref = Database.database().reference()
        self.registerForFireBaseUpdates()
        
        // Create a GMSCameraPosition that tells the map to display the
        view = self.mapView
    }
}
