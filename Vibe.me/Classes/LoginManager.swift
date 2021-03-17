//
//  LoginManager.swift
//  Vibe.me
//
//  Created by Santiago del Castillo Gonzaga on 17/03/21.
//

import Foundation

class LoginManager {
    var users: [User]
    
    init() {
        self.users = boot(filename: "profiles.json")
    }
    
    func signUp(username: String, password: String) {
        users.append(User(username: username, password: password))
    }
    
    func login(username: String, password: String) -> Bool {
        let user = users.first {user in
            return user.username == username && user.password == password
        }
        if let _ = user {
            return true
        }
        return false
    }
    
    func logout() {
        let filePath = "/Users/pedropacheco/dev/AppleAcademy/Vibe.me/Vibe.me/Resources/profiles.json"
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
