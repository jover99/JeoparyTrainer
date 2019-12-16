//
//  Category.swift
//  JeopardyTrainerRetake
//
//  Created by Richard Jove on 12/13/19.
//  Copyright © 2019 Richard Jove. All rights reserved.
//

import Foundation


class Category {
    var id: Int
    var title: String
    var cluesCount: Int
    
    init(id: Int, title: String, cluesCount: Int) {
        self.id = id
        self.title = title
        self.cluesCount = cluesCount
    
    }
    
}
