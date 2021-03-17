//
//  App.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation
import Combine

class App {
    var playerManager: PlayerManager
    var users: [User]
    
    init() {
        print(Constants.Banners.mainBanner)
        self.playerManager = PlayerManager()
        self.users = boot(filename: "profiles.json")
    }
    
    func execute() {
        self.playerManager.execute()
    }
    
    
}
