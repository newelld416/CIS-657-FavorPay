//
//  LocationLookup.swift
//  GeoCalculator
//
//  Created by Daniel Newell on 5/30/17.
//  Copyright © 2017 Adam Luckenbaugh. All rights reserved.
//

import Foundation

struct GoodDeed {
    
    var id:String
    var title:String
    var location:String
    var description:String
    
    init(id:String, title:String, location:String, description:String) {
        self.id = id
        self.title = title
        self.location = location
        self.description = description
    }
}
