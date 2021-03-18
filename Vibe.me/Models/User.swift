//
//  User.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation

class User: Codable {
    var username: String
    var password: String
    var favoriteSongs: [Song]
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        self.favoriteSongs = []
    }
    
    func addFavoriteSong(newSong: Song) {
        let contains = favoriteSongs.contains { song in
            song.name == newSong.name
        }
        if !contains {
            favoriteSongs.append(newSong)
            print("\nMusic added to your playlist.\n")
        } else {
            print("\nThis song is already in your playlist.\n")
        }
    }
}
