//
//  PlayerMP3.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation
import AVFoundation

class PlayerMP3 {
    private var audioPlayer: AVAudioPlayer
    
    init() {
        self.audioPlayer = AVAudioPlayer()
    }
    
    func setSong(song: String) -> Bool {
        let path = "/Users/pedropacheco/dev/AppleAcademy/test-audio/test-audio/songs/\(song).mp3"
        let url = URL(fileURLWithPath: path)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            return true
        } catch {
            return false
        }
    }
    
    func play() {
        let currTime = self.audioPlayer.currentTime
        if currTime > 0.0 {
            self.audioPlayer.play(atTime: currTime + 0.01)
        } else {
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
        }
    }
    
    func pause() {
        if self.audioPlayer.isPlaying {
            self.audioPlayer.pause()
        } else {
            print("You are not listening to anything")
        }
    }
}
