//
//  Card.swift
//  FlashZilla
//
//  Created by saj panchal on 2021-08-30.
//

import Foundation
import SwiftUI

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}

class Result: ObservableObject {
    @Published var isPassed: Bool = false
}
