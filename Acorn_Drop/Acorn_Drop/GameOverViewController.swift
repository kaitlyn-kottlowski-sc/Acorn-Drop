//
//  GameOverViewController.swift
//  Acorn_Drop
//
//  Created by Khrystina Calo on 12/9/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class GameOverViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
                    // Load the SKScene from 'GameScene.sks'
                    if let scene = SKScene(fileNamed: "GameOverScene") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                         //Present the scene
                        view.presentScene(scene)
                    }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
