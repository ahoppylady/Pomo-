//
//  PMSoundHelper.swift
//  TodoMakeSchool
//
//

import UIKit
import AVFoundation

class PMSoundHelper {
    
    static var audioPlayer : AVAudioPlayer!
    static var player = AVAudioPlayer()
    
    static func playSound(soundFile : String) {
        
        let soundURL = Bundle.main.url(forResource: soundFile, withExtension: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch{
            print(error)
        }
        audioPlayer.play()
        
    }
    
}
