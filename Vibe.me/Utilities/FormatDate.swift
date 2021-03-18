//
//  FormatDate.swift
//  Vibe.me
//
//  Created by Santiago del Castillo Gonzaga on 18/03/21.
//

import Foundation

func DateFormat (date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short

    dateFormatter.locale = Locale(identifier: "pt_BR")
    
    return (dateFormatter.string(from: date))
}

func Greeting (date: Date) -> String {
    let hour = Calendar.current.component(.hour, from: date)
    
    switch hour {
    case 0...5:
        return "Good Night 🌙"
    case 6...12:
        return "Good Morning ☀️"
    case 13...18:
        return "Good Afternoon ⛅️"
    case 19...24:
        return "Good Night 🌙"
    default:
        return "Error"
    }
}


