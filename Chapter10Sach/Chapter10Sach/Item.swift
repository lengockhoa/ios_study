//
//  Item.swift
//  Chapter10Sach
//
//  Created by Le NK on 4/19/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollar: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name: String, serialNumber: String?, valueInDollar: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollar = valueInDollar
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjectives = adjectives[Int(idx)]
            
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjectives) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "_").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollar: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollar: 0)
        }
    }
}
