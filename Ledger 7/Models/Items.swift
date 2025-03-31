//
//  Items.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import SwiftUI
import SwiftData

@Model
class Item {
    var id: UUID
    var itemName: String
    var itemType: ItemType
    var fee: Double
    var addItem: Bool
    
    init(
        id: UUID = UUID(),
        itemName: String = "",
        itemType: ItemType = ItemType.arrangement,
        fee: Double = 0.00,
        addItem: Bool = false
    ) {
        self.id = id
        self.itemName = itemName
        self.itemType = itemType
        self.fee = fee
        self.addItem = addItem
    }
    
    var project: Project?
    
}


enum ItemType: String, CaseIterable, Identifiable, Codable {
    case session = "Recording Session"
    case overdub = "Overdub"
    case concert = "Concert"
    case arrangement = "Arrangement"
    case score = "Score"
    case production = "Production Services"
    case relearsal = "Rehearsal"
    case rental = "Chart Rental"
    case hourLesson = "Lesson (1 hr)"
    case halfLesson = "Lesson (30 mins)"
    
    var id: Self {self}
    
}
