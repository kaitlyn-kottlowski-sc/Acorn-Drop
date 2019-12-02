//
//  TitleScene.swift
//  Acorn_Drop
//
//  Created by Trey Chumbley on 11/20/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import SpriteKit
import GameplayKit

class TitleScene: SKScene{
    
    //Timer delay for acorn spawn
    var acornTimer = 10
    //controls how many acorns are placed on screen
    var accornCount = 45
    
    //used for creating bowl
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let divider = CGFloat(1.3333)
    let buffer = CGFloat(10)
    
    var acornArray: [TitleScreenAcorn] = []
    
    let testAcorn = TitleScreenAcorn(image: SKSpriteNode(imageNamed: "acorn-1"))
    
    override func didMove(to view: SKView){
        let floor = Side(xLocation: 0, yLocation: -screenHeight/divider, width: screenWidth * 2, height: buffer)
        let leftWall = Side(xLocation: -screenWidth/divider, yLocation: screenHeight, width: buffer, height: screenHeight * 4)
        let rightWall = Side(xLocation: screenWidth/divider, yLocation: screenHeight, width: buffer, height: screenHeight * 4)
        
        self.addChild(floor)
        self.addChild(leftWall)
        self.addChild(rightWall)
        
        self.addChild(testAcorn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for acorn in acornArray{
            acorn.move(touchLocation: (touches.first?.location(in: self))!)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for acorn in acornArray{
            acorn.move(touchLocation: (touches.first?.location(in: self))!)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if accornCount > 0 {
            if acornTimer > 0{
                acornTimer = acornTimer - 1
            } else {
                spawnAcorns()
                acornTimer = 10
                accornCount = accornCount - 1
            }
        }
    }
    
    func spawnAcorns(){
        let acorn = TitleScreenAcorn(image: SKSpriteNode(imageNamed: "acorn-1"))
        self.addChild(acorn)
        
        acornArray.append(acorn)
    }
}
