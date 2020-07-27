//
//  Sides.swift
//  Acorn_Drop
//
//  Created by Trey Chumbley on 11/18/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import SpriteKit

class Side: SKNode{
    init(xLocation:CGFloat,yLocation:CGFloat,width:CGFloat,height:CGFloat){
        super.init()
        
        //sets the position and size
        self.position = CGPoint(x: xLocation, y: yLocation)
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: width,height: height))
        
        //applys a physics body to the object
        self.physicsBody?.isDynamic = false
        
        //set the bit mask properties
        self.physicsBody?.categoryBitMask = CollisionObject
        self.physicsBody?.collisionBitMask = CollisionObject
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
