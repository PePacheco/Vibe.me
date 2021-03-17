//
//  PlayerManager.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation

class PlayerManager {
    var player: PlayerMP3
    var isRunningSong: Bool
    var isRunningApp: Bool
    
    init() {
        self.player = PlayerMP3()
        self.isRunningApp = true
        self.isRunningSong = true
    }
    
    func playSong() {
        while isRunningSong {
            print("""

                [1] => Play the song
                [2] => Pause the song
                [3] => Change de song

                """)
            if let command = readLine() {
                switch command {
                case "1":
                    player.play()
                    break
                case "2":
                    player.pause()
                    break
                case "3":
                    player.pause()
                    isRunningSong = false
                    break
                default:
                    print("I can't recognize this command, please try again")
                }
            }
        }
    }
    
    func execute() {
        while isRunningApp {
            print(Constants.Banners.musicSelection)
            if let song = readLine() {
                if player.setSong(song: song) {
                    isRunningSong = true
                    self.playSong()
                } else if song == "end" {
                    isRunningApp = false
                } else {
                    print("This song does not exists")
                }
            }
        }
    }
}
