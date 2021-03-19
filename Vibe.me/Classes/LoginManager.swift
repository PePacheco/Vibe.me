//
//  LoginManager.swift
//  Vibe.me
//
//  Created by Santiago del Castillo Gonzaga on 17/03/21.
//

import Foundation

class LoginManager {
    var users: [User]
    var currentUser: User?
    
    init() {
        self.users = boot(filename: "profiles.json")
    }
    
    func addFavoriteSong(newSong: Song) {
        let user = users.first() { user in
            user.username == currentUser?.username && user.username == currentUser?.username
        }
        if let user = user {
            user.addFavoriteSong(newSong: newSong)
        }
    }
    
    func signUp(username: String, password: String) {
        let user = User(username: username, password: password)
        users.append(user)
        self.currentUser = user
    }
    
    func login(username: String, password: String) -> Bool {
        let user = users.first {user in
            return user.username == username && user.password == password
        }
        if let user = user {
            self.currentUser = user
            return true
        }
        return false
    }
    
    func logout() {
        let filePath = "/Users/santiago/Vibe.me-IOS/Vibe.me/Resources/profiles.json"
        let file = URL(fileURLWithPath: filePath)
        do {
            let encoder = JSONEncoder()
            let json = try encoder.encode(users)
            try json.write(to: file)
        } catch {
            print(error)
        }
    }
}
