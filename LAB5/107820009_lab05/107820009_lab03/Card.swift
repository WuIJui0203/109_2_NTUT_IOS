//
//  Card.swift
//  107820009_lab03
//
//  Created by WUIJUI on 2021/3/24.
//

import Foundation
struct Card: Hashable {
    var hashValue: Int{
        return identifier
    }
    static func == (lhs: Card, rhs: Card)->Bool{
        return lhs.identifier == rhs.identifier
    }
    var isFaceUp = false
    var isMatched = false
    private var identifier:Int
    init(identifier:Int) {
        self.identifier = identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
