//
//  Card.swift
//  FlashZilla
//
//  Created by saj panchal on 2021-08-30.
//

import Foundation

struct Card {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
