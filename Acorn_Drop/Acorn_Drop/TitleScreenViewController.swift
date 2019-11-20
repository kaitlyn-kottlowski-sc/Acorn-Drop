//
//  ViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var leaderboardButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    let roundedness = 8
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let divider = 1.3333
    let buffer = 10
    
    
    
    
    public var attribute = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create rounded buttons
        startButton.layer.cornerRadius = CGFloat(roundedness)
        leaderboardButton.layer.cornerRadius = CGFloat(roundedness)
        settingButton.layer.cornerRadius = CGFloat(roundedness)
        
        //Load the SKScene from 'TitleScene.sks'
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "TitleScene"){
                scene.scaleMode = .aspectFill
                
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue,                                 sender: Any?)
    {
        if let destinationViewController =                                 segue.destination as? SettingsViewController
        {
            destinationViewController.someAttribute = 5
        }
    }
    
    @IBAction func unwindFromSettings(sender:
        UIStoryboardSegue)
    {
        print("Attribute = \(attribute)")
        // This is a public attribute in viewcontroller A.
        // Its value will be set in viewcontroller B.
    }
    

}

