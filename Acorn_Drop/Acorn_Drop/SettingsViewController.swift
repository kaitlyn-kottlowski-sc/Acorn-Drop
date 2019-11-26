//
//  SettingsViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource
{
   
    public var someAttribute = 0
     var squirrelCostumes = ["Default", "Poncho", "Cat", "Football Player", "Hotdog"]
    public var playerType: String?

    @IBOutlet weak var chooseSquirrel: UIPickerView!
    @IBOutlet weak var chosenSquirrelImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Some attribute =  \(someAttribute)")
        
        self.chooseSquirrel.dataSource = self
        self.chooseSquirrel.delegate = self
        
        chooseSquirrel.selectRow(Player.getType(), inComponent: 0, animated: true)

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
    
    // Functions for squirrell picker
      func numberOfComponents(in pickerView: UIPickerView) -> Int {
             return 1
         }

      func pickerView(_ pickerView: UIPickerView,
          numberOfRowsInComponent component: Int) -> Int {

              // Row count: rows equals array length.
              return squirrelCostumes.count
      }
    
      func pickerView(_ pickerView: UIPickerView,
          titleForRow row: Int,
          forComponent component: Int) -> String? {

        
              // Return a string from the array for this row.
        
                let squirrelType = squirrelCostumes[row]
        
              if squirrelType == "Football Player" {
                    playerType = "football_squirrel"
                }
                else if squirrelType == "Poncho" {
                    playerType = "poncho_squirrel"
                }
                else if squirrelType == "Hotdog" {
                    playerType = "hotdog_squirrel"
                }
                else if squirrelType == "Cat" {
                    playerType = "cat_squirrel"
                }
                else if squirrelType == "Default"{
                    playerType = "Squirrel"
                }
        
                chosenSquirrelImage.image = UIImage(named: playerType!)
                Player.setSquirrelName(i: playerType!)
                Player.setType(t: row)
              return squirrelCostumes[row]
      }

}
