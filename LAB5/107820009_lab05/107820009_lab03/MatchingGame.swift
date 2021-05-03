//
//  MatchingGame.swift
//  107820009_lab03
//
//  Created by WUIJUI on 2021/3/24.
//

import Foundation
class MatchingGame{
    var indexOfOneAndOnlyFaceCard: Int?{
        get{
            var foundIndex:Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    var cards = [Card]()
    func chooseCard(at index: Int) -> Int{
        var point = -1
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceCard{
                if matchIndex == index {
                    cards[index].isFaceUp = false
                    indexOfOneAndOnlyFaceCard = nil

                }
                if cards[matchIndex] == cards[index] && index != matchIndex{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    point += 5
                }
                cards[index].isFaceUp = true
                
                }
            else
            {
                indexOfOneAndOnlyFaceCard = index
            }

        }
        return point
    }
    init(numberOfCards:Int) {
        var id = [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8]
        id.shuffle()
        for identifier in 1...(numberOfCards) {
            let card = Card(identifier: id[identifier-1])
            cards.append(card)
        }
    }
}
