//
//  GameOver.swift
//  Acorn_Drop
//
//  Created by Khrystina Calo on 12/9/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameOver: SKScene
{
    override func didMove(to view: SKView)
    {
        inputBackground()
    }
    
    func inputBackground()
    {
        let background = SKSpriteNode(imageNamed: Player.getSquirrelBackground())
        
        background.position = CGPoint(x: 0, y: 0)
        background.size = CGSize(width: frame.width, height: frame.height)
        addChild(background)
    }
}
