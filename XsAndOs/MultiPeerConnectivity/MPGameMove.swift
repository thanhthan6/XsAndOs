//
//  MPGameMove.swift
//  XsAndOs
//
//  Created by Macbook on 15/07/2023.
//

import Foundation

struct MPGameMove: Codable {
    enum Action: Int, Codable {
        case start, move, reset, end
    }
    let action: Action
    let playerName: String?
    let index: Int?
    
    func data() -> Data? {
        try? JSONEncoder().encode(self)
    }
}
