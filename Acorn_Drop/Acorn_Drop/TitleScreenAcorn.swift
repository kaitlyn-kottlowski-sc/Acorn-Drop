//
//  TitleScreenAcorn.swift
//  Acorn_Drop
//
//  Created by Trey Chumbley on 11/18/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import SpriteKit

class TitleScreenAcorn: SKNode{
    init(image: SKSpriteNode) {
        super.init()
        
        //determines side of x axis object will spawn
        let randomNumber = arc4random_uniform(2)
        let random: CGFloat = randomNumber == 0 ? 1 : -1
        
        //add buffer to starting x coordinate
        let buffer = 150
        var xStart = CGFloat(arc4random_uniform(UInt32(UIScreen.main.bounds.width)))
        
        if random > 0{
            xStart = xStart - CGFloat(buffer)
        } else{
            xStart = xStart * random + CGFloat(buffer)
        }
    
        //sets starting location at a random x location above the screen
        self.position = CGPoint(x: xStart, y: UIScreen.main.bounds.height)
        
        //set size of image
        self.setScale(1)
        
        //applies a physics body to the node
        self.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "acorn-1"), size: CGSize(width: image.size.width, height: image.size.height))
        
        //adds image to object
        self.addChild(image)
        
        //set the bit mask properties
        self.physicsBody?.categoryBitMask = CollisionObject
        self.physicsBody?.collisionBitMask = CollisionObject
        //self.physicsBody?.contactTestBitMask = CollisionObject
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
    
    func move(touchLocation: CGPoint){
        if self.calculateAccumulatedFrame().contains(touchLocation){
            self.position.x = touchLocation.x
            self.position.y = touchLocation.y
        }
    }
}
