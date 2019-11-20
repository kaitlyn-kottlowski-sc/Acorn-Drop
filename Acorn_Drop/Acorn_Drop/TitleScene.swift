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
    override func didMove(to view: SKView){
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        //<#code#>
    }
    
    func spawnAcorns(){
        let acorn = TitleScreenAcorn(image: SKSpriteNode(imageNamed: "acorn-1"))
        self.addChild(acorn)
    }
}
