//
//  GoodDeed.swift
//  FavorPayApp
//

import Foundation
import GooglePlacePicker

struct GoodDeed {
    
    var id:String
    var title:String
    var desc:String
    var points:Int
    var timeStamp:String
    var longitude:String
    var latitude: String
    var formattedAddress: String
    
    init(id:String, title:String, desc:String, points:Int, timeStamp:String, longitude:String, latitude:String, formattedAddress:String) {
        self.id = id
        self.title = title
        self.desc = desc
        self.points = points
        self.timeStamp = timeStamp
        self.longitude = longitude
        self.latitude = latitude
        self.formattedAddress = formattedAddress
    }
}
