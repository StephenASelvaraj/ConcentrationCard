//
//  ViewController.swift
//  ConcentrationCard
//
//  Created by Stephen Selvaraj on 5/3/18.
//  Copyright © 2018 Stephen Selvaraj. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
   @IBOutlet var CardButtons: [UIButton]!

    lazy var game = Concentration(numberofpairofCards: (CardButtons.count+1)/2 )
    //lazy cannot have didset and it can not observe value changes
    
    
    @IBAction func TouchCard(_ sender: UIButton) {
        if let cardNumber = CardButtons.index(of: sender){
            flipcount += 1
          print ("card number \(cardNumber)")
          game.choosecard(at: cardNumber)
          UpdateViewfromModel()
        
          if cardNumber < 12 {
             // putimage(sender, emojichoices[cardNumber])
            }
        }else {
            print ("button is not in cardbuttons")
        }
       
    }
    
    @IBAction func StartNewGamexxx(_ sender: UIButton) {
        flipcount = 0
        //emojichoices = ["⚽️⚾️🎾🏸", "🏏","🏓","⛳️","🏈"]
        game = Concentration(numberofpairofCards: (CardButtons.count+1)/2 )
        UpdateViewfromModel()
    }
    
    func UpdateViewfromModel () {
        for index in CardButtons.indices {
            let button = CardButtons[index]
            let card = game.cards[index]
            if card.isFaceup{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white   
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.ismatched ? UIColor.clear : UIColor.orange
            }
        }
        
    }
    
    var emojichoices = "🎃🍕🍎🌮🦀🐧🐅🤣🐒🦋🐷"
    
    
    // Dictionary - integer pointing to a string
    var emoji  = [Card :String]()
    
    func emoji(for card:Card) -> String {
        if emoji[card] == nil, emojichoices.count > 0 {
            //let randomindex = Int(arc4random_uniform(UInt32(emojichoices.count)))
            let stringIndex = emojichoices.index(emojichoices.startIndex, offsetBy: emojichoices.count.arc4Random)
            emoji[card] = String(emojichoices.remove(at: stringIndex ))
        }
        return emoji[card] ?? "?"
    }
    
    
    @IBOutlet weak var FlipCountLabel: UILabel!
    
    var flipcount = 0 {
        //didSet helps to assign a variable value to a label on the UI
        didSet {
        FlipCountLabel.text = "Flip Count \(flipcount)"
        }
    }
    
    // TODO: Play new game

    func putimage (_ button: UIButton, _ emoji : String) {
        flipcount += 1
        if  button.currentTitle == " " || button.currentTitle == nil {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        
        } else {
            button.setTitle(" ", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        }
    }
    
    
}

extension Int {
    var arc4Random: Int {
        switch self {
        case 1...Int.max:
            return Int(arc4random_uniform(UInt32(self)))
        case -Int.max..<0:
            return Int(arc4random_uniform(UInt32(self)))
        default:
            return 0
        }
        
    }
}

