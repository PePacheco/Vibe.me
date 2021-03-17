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
    var loginManager: LoginManager
    
    init() {
        print(Constants.Banners.mainBanner)
        self.playerManager = PlayerManager()
        self.users = boot(filename: "profiles.json")
        self.loginManager = LoginManager()
    }
    
    func execute() {
        if let credentials = readLine() {
            let credentialsArray = credentials.components(separatedBy: " ")
            print(credentialsArray)
            if self.loginManager.login(users: users, username: credentialsArray[0], password: credentialsArray[1]){
                self.playerManager.execute()
            }
        }
    }
    
    
}
