//
//  CheckGame.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 12/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import Foundation
import UIKit

class Checkgame
{
    static var gameState: Bool! = true
    
    func checkGameStatus(lives:Int, gameDone:Bool) -> (Int, Bool)
    {
        var lives = lives
        var gameDone = gameDone
        
        if(lives <= 0)
        {
            lives = 0
            gameDone = true
        }
        else
        {
            gameDone = false
        }
        return (lives, gameDone)
    }
    
    static func setGameStatus(status: Bool)
    {
        gameState = status
    }
    
    static func getGameStatus() -> Bool
    {
        return gameState
    }
}
