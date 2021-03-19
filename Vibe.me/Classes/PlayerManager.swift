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
        isRunningSong = true
        while isRunningSong {
            print(Constants.Banners.clear)
            print("""

                🔊 \(String(describing: self.player.currentSong!.name)) 🔊
                [1] => Play ▶️
                [2] => Pause ⏸
                [3] => Change ⏹
                [4] => Favorite ❤️

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
                    print(Constants.Banners.clear)
                    print("❌I can't recognize this command, please try again❌")
                }
            }
        }
    }
    
    func runAllSongs(loginManager: LoginManager) {
        isRunningAllSongs = true
        while isRunningAllSongs {
            print(Constants.Banners.clear)
            print(self.player.getSongsList())
            if let index = readLine() {
                if index.isNumber {
                    if player.setSong(index: index) {
                        isRunningSong = true
                        self.playSong(loginManager: loginManager)
                    } else {
                        print(Constants.Banners.clear)
                        print("❌This song does not exists❌")
                    }
                } else if index == "x" {
                    isRunningAllSongs = false
                } else {
                    print(Constants.Banners.clear)
                    print("❌Not a valid entry❌")
                }
            }
        }
    }
    
    func runFavoriteSongs(loginManager: LoginManager) {
        isRunningFavoriteSongs = true
        while isRunningFavoriteSongs {
            print(Constants.Banners.clear)
            print(self.player.getSongsList(user: loginManager.currentUser!))
            if let index = readLine() {
                if index.isNumber {
                    if player.setSongByUser(index: index, user: loginManager.currentUser!) {
                        isRunningFavoriteSongs = true
                        self.playSong(loginManager: loginManager)
                    } else {
                        print(Constants.Banners.clear)
                        print("❌This song does not exists❌")
                    }
                } else if index == "x" {
                    isRunningFavoriteSongs = false
                } else {
                    print(Constants.Banners.clear)
                    print("❌Not a valid entry❌")
                }
            }
        }
    }
    
    func execute(loginManager: LoginManager) {
        var count = 0
        while isRunningPlayer {
            if count > 0 {
                print(Constants.Banners.clear)  
            }
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
                    print(Constants.Banners.clear)
                    print("❌Invalid command❌")
                    break
                }
            }
            count += 1
        }
    }
}
