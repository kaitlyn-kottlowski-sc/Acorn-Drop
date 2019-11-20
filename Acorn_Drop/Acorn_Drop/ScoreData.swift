//
//  ScoreData.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/11/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import UIKit


public struct Scores : Codable {
    var userName: String
    var score: Int
}

class ScoreData : Codable{
    
    static var highScoreList = [Scores]()
    
    static func getJSON() -> Any{
        
        // Resource #1: https://www.journaldev.com/21839/ios-swift-json-parsing-tutorial
        // Resource #2: https://www.youtube.com/watch?v=ih20QtEVCa0
        
        guard let url = Bundle.main.url(forResource: "scores", withExtension: "json") else {return (Any).self}

        guard let data = try? Data(contentsOf: url) else {return (Any).self}
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return (Any).self}
        
        return json

    }

    static func getJSONData() -> [Scores]
    {
        let json = getJSON()
            
        if let JSON = json as? [String: Any] {
            
            guard let jsonArray = JSON["scores"] as? [[String: Any]] else {return highScoreList}
            
            for json in jsonArray {
                let userName = json["userName"]
                let score = json["score"]
                let highScore = Scores(userName: userName as! String, score: score as! Int)
                highScoreList.append(highScore)
            }
        }
        return highScoreList
    }
    
    static func decodeData(userName: String, score: Int)
    {
       guard let url = Bundle.main.url(forResource: "scores", withExtension: "json") else {return}
        
        let json = getJSON()
        
        if let JSON = json as? [String: Any] {
        
            guard var jsonArray = JSON["scores"] as? [[String: Any]] else {return}
    
            jsonArray.append(["userName": userName, "score": score])
        
            for json in jsonArray {
                  let userName = json["userName"]
                  let score = json["score"]
                  let highScore = Scores(userName: userName as! String, score: score as! Int)
                  highScoreList.append(highScore)
                
              }
            highScoreList = highScoreList.sorted(by: {$0.score > $1.score})
            
            // Reference: https://medium.com/@lkleung0531/ios-how-to-read-and-update-local-json-file-with-tableview-1b6c2a49e7b4
            do {
                   let encoder = JSONEncoder()
                   encoder.outputFormatting = .prettyPrinted
                   let JsonData = try encoder.encode(highScoreList)
                   try JsonData.write(to: url)
               } catch { print("error")}
        }
    }
}


