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
    private var squirrelCostumes = ["Default", "Poncho", "Cat", "Football Player", "Hotdog", "Icecream Cone", "Astronaut"]
    private var squirrelPlayerTypes = ["Squirrel", "poncho_squirrel","cat_squirrel","football_squirrel","hotdog_squirrel","icecream_squirrel", "astronaut_squirrel"]
    private var squirrelBackgrounds = ["squirrel_background", "poncho_background", "cat_background", "football_background", "hotdog_background", "icecream_background", "astronaut_background"]
    private var playerType: String = "Squirrel"
    private var playerBackground: String? = "Squirrel"

    @IBOutlet weak var chooseSquirrel: UIPickerView!
    @IBOutlet weak var chosenSquirrelImage: UIImageView!

    @IBOutlet weak var enableBackgroundMusicToggle: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        enableBackgroundMusicToggle.isOn = MusicPlayer.isOn;
        self.chooseSquirrel.dataSource = self
        self.chooseSquirrel.delegate = self
        chooseSquirrel.selectRow(Player.getType(), inComponent: 0, animated: true)
    }
    
    @IBAction func goBackToTitle(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enableBackgroundMusic(_ sender: UISwitch)
    {
       if sender.isOn
       {
           MusicPlayer.playBackgroundMusic()
        MusicPlayer.isOn = true
       }
       else
       {
           MusicPlayer.stopBackgroundMusic()
        MusicPlayer.isOn = false
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
              return squirrelCostumes[row]
      }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           
         playerType = squirrelPlayerTypes[row]
             playerBackground = squirrelBackgrounds[row]
        
      chosenSquirrelImage.image = UIImage(named: playerType)
       Player.setSquirrelName(i: playerType)
      Player.setSquirrelBackground(b: playerBackground!)
       Player.setType(t: row)
   }
}
