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
    var isRunningAllSongs: Bool
    var isRunningPlayer: Bool
    var isRunningFavoriteSongs: Bool
    
    init() {
        self.player = PlayerMP3()
        self.isRunningAllSongs = true
        self.isRunningSong = true
        self.isRunningPlayer = true
        self.isRunningFavoriteSongs = true
    }
    
    func playSong(loginManager: LoginManager) {
        while isRunningSong {
            print("""

                [1] => Play the song
                [2] => Pause the song
                [3] => Change de song
                [4] => Favorite the song

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
                case "4":
                    loginManager.addFavoriteSong(newSong: self.player.currentSong!)
                    break
                default:
                    print("\nI can't recognize this command, please try again\n")
                }
            }
        }
    }
    
    func runAllSongs(loginManager: LoginManager) {
        isRunningAllSongs = true
        while isRunningAllSongs {
            print(self.player.getSongsList())
            if let index = readLine() {
                if index.isNumber {
                    if player.setSong(index: index) {
                        isRunningSong = true
                        self.playSong(loginManager: loginManager)
                    } else {
                        print("\nThis song does not exists\n")
                    }
                } else if index == "x" {
                    isRunningAllSongs = false
                } else {
                    print("\nNot a valid entry.\n")
                }
            }
        }
    }
    
    func runFavoriteSongs(loginManager: LoginManager) {
        isRunningFavoriteSongs = true
        while isRunningFavoriteSongs {
            print(self.player.getSongsList(user: loginManager.currentUser!))
            if let index = readLine() {
                if index.isNumber {
                    if player.setSongByUser(index: index, user: loginManager.currentUser!) {
                        isRunningFavoriteSongs = true
                        self.playSong(loginManager: loginManager)
                    } else {
                        print("\nThis song does not exists\n")
                    }
                } else if index == "x" {
                    isRunningFavoriteSongs = false
                } else {
                    print("\nNot a valid entry.\n")
                }
            }
        }
    }
    
    func execute(loginManager: LoginManager) {
        while isRunningPlayer {
            print(Constants.Banners.chooseListScreen)
            if let type = readLine() {
                switch type {
                case "1":
                    runAllSongs(loginManager: loginManager)
                    break
                case "2":
                    runFavoriteSongs(loginManager: loginManager)
                    break
                case "x":
                    isRunningPlayer = false
                default:
                    print("Invalid command.")
                    break
                }
            }
        }
    }
}
