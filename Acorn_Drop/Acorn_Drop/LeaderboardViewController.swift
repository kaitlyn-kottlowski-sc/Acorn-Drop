//
//  LeaderboardViewController.swift
//  Acorn_Drop
//
//  Created by Jesse Luangaphayvong on 11/6/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit
import SpriteKit

class LeaderboardViewController: UIViewController {

    var scoreList = [ScoreData]()
    var screenSize = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getJSONData()
        
        for i in 0..<scoreList.count
        {
            let userName = UILabel.init()
            let score = UILabel.init()
            let x = Int(screenSize.width)
            let y = Int(screenSize.height)/4
            userName.frame = CGRect(x: x/4 , y: y + (i*30), width: 100, height: 20)
            score.frame = CGRect(x: x/2,  y: y + (i*30), width: 100, height: 20)
            
            userName.text = scoreList[i].userName
            score.text = String(scoreList[i].score)
            
            self.view.addSubview(userName)
            self.view.addSubview(score)
        }
    }
    

//    func setUpTables()
//    {
//         let userNameTable = UITableView(frame: CGRect(x: 0 , y: UIScreen.main.bounds.height/5, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2), style: .plain)
//        let scoreTable = UITableView(frame: CGRect(x:  UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/5, width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2), style: .plain)
//
//        userNameTable.translatesAutoresizingMaskIntoConstraints = false
//        scoreTable.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(userNameTable)
//        self.view.addSubview(scoreTable)
//
//        userNameTable.backgroundColor = UIColor.orange
//        scoreTable.backgroundColor = UIColor.blue
//
//        self.userNameTable = userNameTable
//        self.scoreTable = scoreTable
//
//
//
//    }
    
        func getJSONData()
        {
        // Resource #1: https://www.journaldev.com/21839/ios-swift-json-parsing-tutorial
                      // Resource #2: https://www.youtube.com/watch?v=ih20QtEVCa0
                      guard let path = Bundle.main.path(forResource: "scores", ofType: "json") else {return}
                      let url = URL(fileURLWithPath: path)

                          guard let data = try? Data(contentsOf: url) else {return}
                          
                          guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return}

                          if let JSON = json as? [String: Any] {
                              
                              guard let jsonArray = JSON["scores"] as? [[String: Any]] else {return}
                              
                              for json in jsonArray {
                  
                                  scoreList.append(ScoreData.init(json))

                                  
                              }
                           
                           // Resource: http://studyswift.blogspot.com/2017/05/how-to-sort-array-and-dictionary.html
                           scoreList = scoreList.sorted(by: {$0.score > $1.score})
                          
                           for high in scoreList{
                               print(high.userName)
                               print(high.score)
                           }
                          }
    }
}
    
