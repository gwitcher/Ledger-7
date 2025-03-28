//
//  Items.swift
//  Ledger 7
//
//  Created by Gabe Witcher on 3/27/25.
//

import Foundation
import SwiftData

@Model
class Item {
    var id: UUID
    var itemName: String
    var itemType: String
    var fee: Double
    
    init(
        id: UUID = UUID(),
        itemName: String = "",
        itemType: String = "",
        fee: Double
    ) {
        self.id = id
        self.itemName = itemName
        self.itemType = itemType
        self.fee = fee
    }
    
}


enum ItemType: String, CaseIterable, Identifiable {
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
