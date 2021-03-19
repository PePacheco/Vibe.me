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
    
    init() {
        self.player = PlayerMP3()
        self.isRunningAllSongs = true
        self.isRunningSong = true
        self.isRunningPlayer = true
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
    
    func runSongs(loginManager: LoginManager, type: String) {
        isRunningAllSongs = true
        while isRunningAllSongs {
            print(Constants.Banners.clear)
            if type == "1" {
                print(self.player.getSongsList())
            } else {
                print(self.player.getSongsList(user: loginManager.currentUser!))
            }
            if let index = readLine() {
                if index.isNumber {
                    var helper: Bool
                    if type == "1" {
                        helper = player.setSong(index: index)
                    } else {
                        helper = player.setSongByUser(index: index, user: loginManager.currentUser!)
                    }
                    if helper {
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
    
    func execute(loginManager: LoginManager) {
        var count = 0
        while isRunningPlayer {
            if count > 0 {
                print(Constants.Banners.clear)  
            }
            print(Constants.Banners.chooseListScreen)
            if let type = readLine() {
                switch type {
                case "1", "2":
                    runSongs(loginManager: loginManager, type: type)
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
