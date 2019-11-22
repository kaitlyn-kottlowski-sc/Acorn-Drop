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
    
 
    @IBOutlet weak var scoreScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScoreData.decodeData(userName: "nick", score: 200)
        highScoreList = ScoreData.getJSONData()
        LeaderboardScreen.setScoresToScreen(view: scoreScrollView, scoreList: highScoreList)
        LeaderboardScreen.setTitle(view: self.view, leaderboardTitle: leaderboardTitle)
             
//        LeaderboardScreen.setAcornBorder(view: self.view)
        
    }
    
    


    
}
  
