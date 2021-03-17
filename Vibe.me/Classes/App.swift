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
    var loginManager: LoginManager
    
    init() {
        print(Constants.Banners.mainBanner)
        self.playerManager = PlayerManager()
        self.loginManager = LoginManager()
    }
    
    func execute() {
        print(Constants.Banners.firstScreen)
        if let option = readLine() {
            if option == "1" {
                print(Constants.Banners.loginScreen)
                if let credentials = readLine() {
                    let credentialsArray = credentials.components(separatedBy: " ")
                    if self.loginManager.login(username: credentialsArray[0], password: credentialsArray[1]){
                        self.playerManager.execute()
                    } else {
                        print("Login failed. Stopping program.")
                    }
                }
            } else if option == "2" {
                print(Constants.Banners.signUpScreen)
                if let credentials = readLine() {
                    let credentialsArray = credentials.components(separatedBy: " ")
                    self.loginManager.signUp(username: credentialsArray[0], password: credentialsArray[1])
                    self.playerManager.execute()
                    self.loginManager.logout()
                }
            } else {
                print("Invalid option. Stopping program.")
            }
        }
    }
}
