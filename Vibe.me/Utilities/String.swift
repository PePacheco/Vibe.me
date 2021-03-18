//
//  String.swift
//  Vibe.me
//
//  Created by Santiago del Castillo Gonzaga on 18/03/21.
//

import Foundation

extension String  {
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
