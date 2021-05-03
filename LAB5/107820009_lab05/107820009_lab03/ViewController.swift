//
//  ViewController.swift
//  107820009_lab03
//
//  Created by WUIJUI on 2021/3/22.
//

import UIKit

class ViewController:UIViewController {
    var game = MatchingGame(numberOfCards:16)
    var flipCount:Int = 0
    {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var point: UILabel!
    var points:Int = 0
    {
        didSet{
            point.text = "Points: \(points)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func touched(_ sender: UIButton) {
        if let index = cards.index(of: sender){
            var add = game.chooseCard(at: index)
            points = points +  add
            flipCount+=1
            updateViewFromModel()
            
        }
    }
    
    func updateViewFromModel(){
        for index in cards.indices{
            let card = game.cards[index]
            let button = cards[index]
            if card.isFaceUp{
                if card.isMatched {
                    button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
                else{
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                }
                button.setTitle(emoji(for: card),for:UIControl.State.normal)
            }else{
                button.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
        }
        
    }
    var emojiDict:Dictionary<Card,String> = Dictionary<Card,String>()
    var emojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
    func emoji(for card: Card)->String{
        if emojiDict[card] == nil{
            let randomIndex = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiDict[card] = emojis.remove(at: randomIndex)
            
        }
        return emojiDict[card] ?? "?"
    }
    @IBOutlet var cards: [UIButton]!
    var flipped = false
    @IBAction func reset(_ sender: Any) {
        emojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
        game = MatchingGame(numberOfCards: 16)
        emojiDict = Dictionary<Card,String>()
        flipCount = 0
        points = 0
                for index in 0...15 {
                    let button = cards[index]
                            button.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
                            button.setTitle("", for: UIControl.State.normal)
                }
//        for index in 0...7 {
//            let card = game.cards[index]
//            let button = cards[index]
//            if flipped{
//                if !card.isFaceUp {
//                    game.chooseCard(at: index)
//                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//                    button.setTitle(emoji(for: card),for:UIControl.State.normal)
//                }
//
//            }else{
//                if card.isFaceUp {
//                    game.chooseCard(at: index)
//                    button.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
//                    button.setTitle("", for: UIControl.State.normal)
//                }
//
//            }
//        }
//        flipped = !flipped
//        flipCount = 0
    }
    var allflipped = true

    @IBAction func flipall(_ sender: Any) {
        points = 0
        flipCount = 0
        if (allflipped == true) {
            for index in 0...15 {
                let button = cards[index]
                        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emoji(for: game.cards[index]), for: UIControl.State.normal)
            }
            allflipped = false
        }else{
            for index in 0...15 {
                emojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼"]
                game = MatchingGame(numberOfCards: 16)
                emojiDict = Dictionary<Card,String>()
                let button = cards[index]
                        button.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
                button.setTitle("", for: UIControl.State.normal)
            }
            allflipped = true
        }
        
                
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
}

