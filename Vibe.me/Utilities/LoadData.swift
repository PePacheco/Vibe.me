//
//  LoadData.swift
//  Vibe.me
//
//  Created by Pedro Gomes Rubbo Pacheco on 17/03/21.
//

import Foundation
import Combine

func boot<T: Decodable>(filename: String) -> T {
    let data: Data
    
    let filePath = "/Users/santiago/Vibe.me-IOS/Vibe.me/Resources/profiles.json"
    let file = URL(fileURLWithPath: filePath)
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self)")
    }
}
