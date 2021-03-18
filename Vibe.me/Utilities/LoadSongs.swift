//
//  LoadSongs.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 18/03/21.
//

import Foundation

class LoadSongs {
    static func getSongs() -> [Song] {
        return [
            Song(name: "Mother Africa", fileName: "African.mp3"),
            Song(name: "Christmas Jingle", fileName: "christmas.mp3"),
            Song(name: "Destination is My Name", fileName: "Destination.mp3"),
            Song(name: "Drive Anthem", fileName: "Drive.mp3"),
            Song(name: "Beach Vibes", fileName: "Beach.mp3"),
            Song(name: "Inspiring Acoustic", fileName: "InspiringAcoustic.mp3"),
            Song(name: "Justhea", fileName: "Justhea.mp3"),
            Song(name: "Memory", fileName: "Memory.mp3")
        ]
    }
}
