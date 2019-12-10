//
//  LeaderboardViewController.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/6/19.
//  Copyright © 2019 Kaitlyn Kottlowski. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
  

class LeaderboardViewController: UIViewController {

     var screenSize = UIScreen.main.bounds
    var leaderboardTitle = UILabel.init()
    var myJSON = JSONEncoder()
    var highScoreList = [Scores]()
    
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var scoreInput: UITextField!
    
    @IBOutlet weak var scoreScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        highScoreList = ScoreData.getHighScoreList()
        LeaderboardScreen.setScoresToScreen(view: scoreScrollView, scoreList: highScoreList)
        LeaderboardScreen.setTitle(view: self.view, leaderboardTitle: leaderboardTitle)
    
    }
    
    
    @IBAction func AddScore(_ sender: Any) {
        
        let userName: String = userNameInput.text!
        let score: String = scoreInput.text!
        
        if !userName.isEmpty && !score.isEmpty {
            ScoreData.decodeData(userNameInput: userName, scoreInput: Int(score) ?? 0)
            
               viewDidLoad()
        }
    }
}
  
