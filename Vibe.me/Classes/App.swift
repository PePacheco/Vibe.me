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
            switch option {
            case "1":
                self.logIn()
            case "2":
                self.signUp()
            default:
                print("Invalid option. Stopping program.")
            }
        }
    }
    
    func logIn() {
        print("\n▫️ Type your USERNAME:")
        if let username = readLine() {
            print("\n▫️ Type your PASSWORD:")
            if let password = readLine() {
                if self.loginManager.login(username: username, password: password) {
                    print(Constants.Banners.clear)
                    print("▫️ Login Verified Successfully, Welcome \(username) ▫️")
                    self.playerManager.execute(loginManager: loginManager)
                    self.loginManager.logout()
                } else {
                    print("User not found or incorrect password. Stopping the program.")
                }
            }
        }
    }
    
    func signUp() {
        print("\n▫️ Type your USERNAME:")
        if let username = readLine() {
            print("\n▫️ Type your PASSWORD:")
            if let password = readLine() {
                print(Constants.Banners.clear)
                print("▫️ Signing Up Ocurred Successfully, Welcome \(username) ▫️")
                self.loginManager.signUp(username: username, password: password)
                self.playerManager.execute(loginManager: loginManager)
                self.loginManager.logout()
            }
        }
    }
}
