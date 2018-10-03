//
//  Concentration.swift
//  ConcentrationCard
//
//  Created by Stephen Selvaraj on 5/11/18.
//  Copyright © 2018 Stephen Selvaraj. All rights reserved.
// MODEL Implementation

import Foundation

class Concentration {
    
    //creating cards array of struct Card with initilization
    var cards = [Card] ()
    
    var indexOfOneandOnlyCardFaceup : Int?
    
    func choosecard (at index:Int) {
        
        if !cards[index].ismatched {
            if let matchindex = indexOfOneandOnlyCardFaceup , matchindex != index {
                //check if cards match
                if cards[matchindex] == cards[index] {
                    cards[matchindex].ismatched = true
                    cards[index].ismatched = true
                }
                cards[index].isFaceup = true
                indexOfOneandOnlyCardFaceup = nil
            } else {
                //either no cards and 2 cards face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneandOnlyCardFaceup = index
            }
        }
        
        /*
        if cards[index].isFaceup{
        cards[index].isFaceup = false
        } else {
            cards[index].isFaceup = true
        }*/
        
    }
    
    //class initialization function
    init (numberofpairofCards : Int) {
        for _ in 1...numberofpairofCards {
            let card = Card()
            //copy 2 identical cards to cards array
            cards += [card, card]
        }
        
        //TODO: Shuffle the cards
        for k in stride(from: cards.count - 1, to: 0, by: -1) {
            cards.swapAt(Int(arc4random_uniform(UInt32(k + 1))), k)
        }
    }
    
}
