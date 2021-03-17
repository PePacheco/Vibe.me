//
//  LoginManager.swift
//  Vibe.me
//
//  Created by Santiago del Castillo Gonzaga on 17/03/21.
//

import Foundation

struct LoginManager {
    
    func login(users: [User], username: String, password: String) -> Bool {
        let user = users.first {user in
            return user.username == username && user.password == password
        }
        if let _ = user {
            return true
        }
        return false
    }
    
}
