//
//  GameScene.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/8/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class PlayerMovement: SKScene
{
    //emitternode load background
    var backgroundPicture: SKEmitterNode!
    var player = SKSpriteNode?()
    var playerColor = UIColor.orangeColor()
    var backGroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    var playerSize = CGSize(width: 50, height: 50)
    var touchLocation = CGPoint?()

    override func didMoveToView(view: SKView)
    {
        // set background
        // background = SKEmitterNode(fileNamed:"")
        self.backGroundColor = backGroundColor
        spawnPlayer()
    }

    func spawnPlayer()
    {
        player = SKSpriteNode(color: playerColor, size: playerSize)
        player?.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - 200)
        self.addChild(player!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch in touches
        {
            let touchLocation = touch.locationInNode(self)
            movePlayer()
        }
    }

    func movePlayer()
    {
        player?.position.x = touchLocation?.x
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
        /*func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
        func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
        func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
        func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }*/
    
    
        func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
}
