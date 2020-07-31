//
//  MusicPlayer.swift
//  Acorn_Drop
//
//  Created by Kaitlyn Kottlowski on 11/25/19.
//  Copyright © 2019 Jesse Luangaphayvong. All rights reserved.
//

import AVFoundation

class MusicPlayer {
    
    static var audioPlayer: AVAudioPlayer?
    static var isOn: Bool = true

    static func startBackgroundMusic() {
        if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3") {
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    static func playBackgroundMusic(){
        audioPlayer?.play()
    }
    
    static func stopBackgroundMusic(){
        audioPlayer?.stop()
    }
    
    static func isPlaying() -> Bool? {
        return audioPlayer?.isPlaying
    }
    
}

