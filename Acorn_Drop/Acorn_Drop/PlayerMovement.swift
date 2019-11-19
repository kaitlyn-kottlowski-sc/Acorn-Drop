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
    //var backgroundPicture: SKEmitterNode
    var player : SKSpriteNode!
    var playerColor = UIColor.blue
    var backgroundColorCustom = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    var playerSize = CGSize(width: 50, height: 50)
    var scoreLabel: SKLabelNode!
    var score: Int = 0
    
    var gameTimer:Timer!
    var possibleFallingObjects = ["acorn"]
    
    let acornCategory:UInt32 = 0x1 << 1
    let squirrelCategory:UInt32 = 0x1 << 0
    
    override func didMove(to view: SKView) {
        // set background
        // background = SKEmitterNode(fileNamed:"")
        self.backgroundColor = backgroundColorCustom
        spawnPlayer()
        spawnScoreLabel()
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(addAcorn), userInfo: nil, repeats: true)
    }
    
    func spawnPlayer()
    {
        player.name = "squirrel"
        //first line is place holder, replace color with imageNamed: "FileString"
        player = SKSpriteNode(imageNamed: "Squirrel")
        //player.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 520)
        player.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = false
        
        player.physicsBody?.categoryBitMask = squirrelCategory
        player.physicsBody?.contactTestBitMask = acornCategory
        player.physicsBody?.collisionBitMask = 0
        player.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(player)
    }
    
    func spawnScoreLabel()
    {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: \(score)"
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.position = CGPoint(x: self.frame.size.width/2.5 * -1, y: self.frame.size.height/2.3)
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.white
        score = 0
        self.addChild(scoreLabel)
    }
    
    @objc func addAcorn()
    {
        let acorn = SKSpriteNode(imageNamed: "acorn")
        
        let randomAcornPosition = GKRandomDistribution(lowestValue: 0, highestValue: 414)
        let position = CGFloat(randomAcornPosition.nextInt())
        
        acorn.name = "acorn"
        acorn.size = CGSize(width: 50, height: 50)
        acorn.position = CGPoint(x: position, y: self.frame.size.height - acorn.size.height)
        
        acorn.physicsBody = SKPhysicsBody(rectangleOf: acorn.size)
        acorn.physicsBody?.isDynamic = true
        
        acorn.physicsBody?.categoryBitMask = acornCategory
        acorn.physicsBody?.contactTestBitMask = squirrelCategory
        acorn.physicsBody?.collisionBitMask = 0
        
        self.addChild(acorn)
        
        let animationDuration:TimeInterval = 6
        
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: position, y: -acorn.size.height), duration: animationDuration))
        
        actionArray.append(SKAction.removeFromParent())
        
        acorn.run(SKAction.sequence(actionArray))
    }
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask
        {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else
        {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (firstBody.categoryBitMask & squirrelCategory) != 0 && (secondBody.categoryBitMask & acornCategory) != 0
        {
            print("Collide")
        }
        else if (firstBody.categoryBitMask & acornCategory) != 0 && (secondBody.categoryBitMask & squirrelCategory) != 0
        {
            print("Collide")
        }
    }
    
    func didPlayerCollideWithAcorn(squirrel :SKSpriteNode, acorn:SKSpriteNode)
    {
        acorn.removeFromParent()
        score += 1
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
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
