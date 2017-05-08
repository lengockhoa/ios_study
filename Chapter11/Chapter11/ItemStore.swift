//
//  ItemStore.swift
//  Chapter11
//
//  Created by Le NK on 4/26/17.
//  Copyright © 2017 Le NK. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}

