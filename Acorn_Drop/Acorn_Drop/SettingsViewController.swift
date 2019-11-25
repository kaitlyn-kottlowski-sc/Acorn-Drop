//
//  SettingsViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{
    public var someAttribute = 0

   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Some attribute =  \(someAttribute)")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackToTitle(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enableBackgroundMusic(_ sender: UISwitch) {
           
           if sender.isOn {
               MusicPlayer.playBackgroundMusic()
           }
           else {
               MusicPlayer.stopBackgroundMusic()
           }
       }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?)
    {
        if let destinationViewController =
            segue.destination as? ViewController
        {
            destinationViewController.attribute = 2
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
