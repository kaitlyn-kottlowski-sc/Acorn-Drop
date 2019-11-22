//
//  LeaderboardScreen.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/13/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit

class LeaderboardScreen {
    
    static var screenSize = UIScreen.main.bounds
    static var x = screenSize.width
    static var y = screenSize.height

    
    static func setScoresToScreen(view: UIScrollView, scoreList: [Scores])
       {
        
       let userNameLabel = UILabel.init()
        let scoreLabel = UILabel.init()

        userNameLabel.frame = CGRect(x: Int(x)/5 , y: 10, width: 150, height:
            20)
        scoreLabel.frame = CGRect(x: Int(x)/2,  y: 10, width: 150, height: 20)

        userNameLabel.text = "Username:"
        scoreLabel.text = "Score:"
        
         userNameLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
              scoreLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        
        view.layer.cornerRadius = 4
        view.addSubview(userNameLabel)
        view.addSubview(scoreLabel)

        for i in 0..<scoreList.count
           {
               let userName = UILabel.init()
               let score = UILabel.init()
               
               userName.frame = CGRect(x: Int(x)/4 , y: 70+(i*40), width: 150, height: 20)
               score.frame = CGRect(x: Int(x)/2,  y: 70+(i*40), width: 150, height: 20)
               
               userName.text = scoreList[i].userName
               score.text = String(scoreList[i].score)

               userName.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
               score.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
           
       
               view.addSubview(userName)
               view.addSubview(score)
           }
       }
       
    static func setTitle(view: UIView, leaderboardTitle: UILabel){

           
           leaderboardTitle.frame = CGRect(x: 0, y: screenSize.height/6, width: screenSize.width/2, height: 50)
           leaderboardTitle.textAlignment = .center
           leaderboardTitle.center.x = x/2

           leaderboardTitle.text = "High Scores"
           leaderboardTitle.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
           leaderboardTitle.backgroundColor = UIColor.orange
           leaderboardTitle.layer.masksToBounds = true
           leaderboardTitle.layer.cornerRadius = 4
           
           view.addSubview(leaderboardTitle)
       
       }
    
    static func setAcornBorder(view:UIView)
    {
        let imageSize = 60
        let numberOfAcornHeight = Int(y)/imageSize
//        let numberOfAcornWidth = Int(x)/imageSize
        
        for i in 0..<numberOfAcornHeight{
            let acornLeft = UIImageView.init()
            let acornRight = UIImageView.init()
            
            acornLeft.image = UIImage(named: "acorn-1.png")
            acornRight.image = UIImage(named: "acorn-1.png")
            
            acornLeft.frame = CGRect(x: 0, y: i*imageSize, width: imageSize, height: imageSize)
            
            acornRight.frame = CGRect(x: Int(x)-imageSize, y: i*imageSize, width: imageSize, height: imageSize)

            
            view.addSubview(acornRight)
            view.addSubview(acornLeft)
        }
        
        
    }
}
