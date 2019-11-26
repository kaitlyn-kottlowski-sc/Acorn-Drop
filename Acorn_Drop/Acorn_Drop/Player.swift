//
//  Player.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/26/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import UIKit

class Player {
    
    static var type: Int = 0
    static var squirrelName: String = "Squirrel"
    
    static func setSquirrelName(i: String)
    {
        squirrelName = i
    }
    
    static func getSquirrelName() -> String{
        return squirrelName
    }
    
    static func setType(t: Int) {
        type = t
    }
    static func getType() -> Int {
        return type
    }
    
}
