//
//  ViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController//, SKScene
{
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var leaderboardButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    
    
    public var attribute = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startButton.layer.cornerRadius = 8
        leaderboardButton.layer.cornerRadius = 8
        settingButton.layer.cornerRadius = 8
        
        
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
    
    func createAcorn(){
        let acorn = SKSpriteNode(imageNamed: "Squirrel")
        //acorn.position = CGPoint(x: CGFloat(Int(arc4random()) & Int(size.width)),y:size.height - acorn.size.height)
        
    }

}

