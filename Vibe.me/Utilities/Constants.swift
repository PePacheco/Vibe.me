//
//  Constants.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation

struct Constants {

    struct Banners {
        
        static let mainBanner = """

        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️
        ▫️        🔈 Vibe.me 🔈        ▫️
        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️

        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️
        ▫️▫️▫️            \(Greeting(date: Date()))             ▫️▫️▫️
        ▫️▫️▫️       TODAY IS  \(DateFormat(date: Date()))       ▫️▫️▫️
        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️

        """
        
        static let musicSelection = """

        [?] To choose a song, type the song code
        [0] => Exit the program

        """

        static let firstScreen = """

        [1] => Log in
        [2] => Sign up
        
        """
    }
}







