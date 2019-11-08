//
//  ViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    public var attribute = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

