//
//  InfoStruct.swift
//  tableViewSimple
//
//  Created by Mac on 03/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import Foundation
enum Course {
    case iPhone
    case Android
    case Swift
    case Java
    case PHP
    case AdvanceJava
}

struct Information {
    var id:Int32 = 0
    var name:String = ""
    var course:Course = .iPhone
    init() {
        //default
    }
    init(id:Int32, name:String, course:Course) {
        self.id = id
        self.name = name
        self.course = course
    }
    
}
