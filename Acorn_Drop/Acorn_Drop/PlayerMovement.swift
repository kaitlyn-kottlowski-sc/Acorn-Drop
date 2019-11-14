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
        //first line is place holder, replace color with imageNamed: "FileString"
        player = SKSpriteNode(imageNamed: "Squirrel")
        player.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 520)
        self.addChild(player)
    }
    
    func spawnScoreLabel()
    {
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: \(score)"
        scoreLabel.horizontalAlignmentMode = .left
        print(self.frame.size.width)
        print(self.frame.size.height)
        scoreLabel.position = CGPoint(x: self.frame.size.width/2.5 * -1, y: self.frame.size.height/2.3)
        print(scoreLabel.position.x)
        print(scoreLabel.position.y)
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
        
        acorn.position = CGPoint(x: position, y: self.frame.size.height + acorn.size.height)
        acorn.physicsBody = SKPhysicsBody(rectangleOf: acorn.size)
        acorn.physicsBody?.isDynamic = true
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
