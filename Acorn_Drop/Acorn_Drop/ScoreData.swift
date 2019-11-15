//
//  ScoreData.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/11/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit

class ScoreData{
    
    var userName: String
    var score: Int
    
    init(_ dictionary: [String: Any])
    {
        self.userName = dictionary["userName"] as? String ?? "userName"
        self.score = dictionary["score"] as? Int ?? 0
    }
}
