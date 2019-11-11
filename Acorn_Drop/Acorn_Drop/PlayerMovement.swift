//
//  GameScene.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/8/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayerMovement: SKScene, SKPhysicsContactDelegate
{
    var backgroundPicture: SKEmitterNode
    var player : SKSpriteNode
    var playerColor = UIColor.orange
    //var backgroundColor = UIColor.blue
    var playerSize = CGSize(width: 50, height: 50)
    var scoreLabel: SKLabelNode
       var score: Int = 0
       {
           didSet
           {
                   scoreLabel.text = "Score: \(score)"
           }
       }
    
    override func didMove(to view: SKView) {
        // set background
        // background = SKEmitterNode(fileNamed:"")
        //self.backGroundColor = backgroundColorHolder
        spawnPlayer()
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
        
        scoreLabel = SKLabelNode(text: "Score: 0")
        scoreLabel.position = CGPoint(x: 100, y: self.frame.size.height - 60)
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.white
        score = 0
        self.addChild(scoreLabel)
    }
    
    func spawnPlayer()
    {
        //first line is place holder, replace color with imageNamed: "FileString"
        player = SKSpriteNode(color: playerColor, size: playerSize)
        player.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 200)
        self.addChild(player)
    }
    
    func touchMoved(touches: Set<UITouch>, withEvent event: UIEvent) {
        for touch in touches
        {
            let touchLocation = touch.location(in: self)
            player.position.x = touchLocation.x
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }

}
