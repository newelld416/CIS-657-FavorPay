//
//  GoodDeed.swift
//  FavorPayApp
//

import Foundation
import GooglePlacePicker

struct DateAndLocation {
    
    var date:Date
    var location:GMSPlace
    
    init(date:Date, location:GMSPlace) {
        self.date = date
        self.location = location
    }
}
