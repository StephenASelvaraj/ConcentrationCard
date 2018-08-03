//
//  Card.swift
//  ConcentrationCard
//
//  Created by Stephen Selvaraj on 5/11/18.
//  Copyright © 2018 Stephen Selvaraj. All rights reserved.
// 

import Foundation

struct Card {
    var isFaceup = false
    var ismatched = false
    var identifier : Int
    
    static var identifierfactory = 0
    
    // initilization for struct
    init () {
        self.identifier = Card.GetUniqueIdentifier()
        
    }
    
    static func GetUniqueIdentifier () -> Int {
        identifierfactory+=1
        return identifierfactory
    }
    
}
