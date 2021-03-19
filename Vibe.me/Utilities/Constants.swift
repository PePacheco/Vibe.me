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
                           🔈 Vibe.me 🔈
                 ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️

        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️
                         \(Greeting(date: Date()))
                     TODAY IS  \(DateFormat(date: Date()))
        ▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️▫️

        """

        static let firstScreen = """

        [1] => Log in 📥
        [2] => Sign up 📂
        
        """
        
        static let chooseListScreen =  """
        [x] => Exit the app ❌
        [1] => All songs 📀
        [2] => Your Favorite Songs ⭐️
        """
        
        static let clear = "\n\n\n\n\n\n\n"
    }
}







