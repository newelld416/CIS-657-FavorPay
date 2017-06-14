//
//  GoodDeed.swift
//  FavorPayApp
//

import Foundation

struct GoodDeed {
    
    var id:String
    var title:String
    var desc:String
    var points:Int
    
    init(id:String, title:String, desc:String, points:Int) {
        self.id = id
        self.title = title
        self.desc = desc
        self.points = points
    }
}
