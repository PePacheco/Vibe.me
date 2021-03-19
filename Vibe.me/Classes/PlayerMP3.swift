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
    var currentSong: Song?
    var songs: [Song]
    
    init() {
        self.audioPlayer = AVAudioPlayer()
        self.songs = LoadSongs.getSongs()
        self.currentSong = nil
    }
    
    func getSongsList() -> String {
        var list = "▫️List of songs available:\n"
        list += "[x] => Go Back ❌\n"
        for (index, song) in songs.enumerated() {
            list += "[\(index)] => \(song.name)\n"
        }
        return list
    }
    
    func getSongsList(user: User) -> String {
        var list = "▫️List of songs available:\n"
        let songs = user.favoriteSongs
        list += "[x] => Go back ❌\n"
        for (index, song) in songs.enumerated() {
            list += "[\(index)] => \(song.name)\n"
        }
        return list
    }
    
    func setSongByUser(index: String, user: User) -> Bool {
        let song = user.favoriteSongs[Int(index)!]
        self.currentSong = song
        let path = "/Users/pedropacheco/dev/AppleAcademy/Vibe.me/Vibe.me/songs/\(song.fileName)"
        let url = URL(fileURLWithPath: path)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func setSong(index: String) -> Bool {
        let song = songs[Int(index)!]
        self.currentSong = song
        let path = "/Users/pedropacheco/dev/AppleAcademy/Vibe.me/Vibe.me/songs/\(song.fileName)"
        let url = URL(fileURLWithPath: path)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: url)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func play() {
        let currTime = self.audioPlayer.deviceCurrentTime
        if currTime > 0.0 {
            self.audioPlayer.play(atTime: currTime)
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
