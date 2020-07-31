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
    
    
    private let roundedness = 8
    private var playMusic = true;
    
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    let divider = 1.3333
    let buffer = 10
    
    public var attribute = 0
    
    private var orange = UIColor(red: 255/255, green: 127/255, blue: 38/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start background music
        if MusicPlayer.isOn {
            MusicPlayer.startBackgroundMusic()
        }

              
            //  Load the SKScene from 'TitleScene.sks'
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destinationViewController = segue.destination as? SettingsViewController
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

