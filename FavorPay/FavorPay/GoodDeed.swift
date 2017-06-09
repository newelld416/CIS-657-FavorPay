//
//  GoodDeed.swift
//  FavorPayApp
//

import Foundation

struct GoodDeed {
    
    var id:String
    var title:String
    var location:String
    var desc:String
    var points:Int
    
    init(id:String, title:String, location:String, desc:String, points:Int) {
        self.id = id
        self.title = title
        self.location = location
        self.desc = desc
        self.points = points
    }
}
