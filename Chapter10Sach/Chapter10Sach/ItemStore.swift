//
//  ItemStore.swift
//  Chapter10Sach
//
//  Created by Le NK on 4/19/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ItemStore{
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init(){
        for _ in 0..<5{
            createItem()
        }
    }
    
}

