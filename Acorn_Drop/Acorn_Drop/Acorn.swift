//
//  Acorn.swift
//  FoodTracker
//
//  Created by Kaitlyn Kottlowski on 11/6/19.
//  Copyright © 2019 Kaitlyn Kottlowski. All rights reserved.
//

import UIKit

class Acorn {

    var acorn_image: UIImageView
    var x: CGFloat
    var y: CGFloat
    var magnitude = 0.1
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
        acorn_image = UIImageView(frame:CGRect(x:x, y:y, width:50, height:50))
        acorn_image.image = UIImage(named: "acorn.jpg")
    }

    
}
