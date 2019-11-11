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
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                    
                    // Reference: http://studyswift.blogspot.com/2017/05/how-to-sort-array-and-dictionary.html
                    scoreList = scoreList.sorted(by: {$0.score > $1.score})
                   
                    for high in scoreList{
                        print(high.userName)
                        print(high.score)
                    }
                   }
                   
               }
    


    }
    
